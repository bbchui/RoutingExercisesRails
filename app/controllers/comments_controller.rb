class CommentsController < ApplicationController
  def index
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      user ? (render json: user.comments) : (render text: "You done fucked up")
    elsif params[:artwork_id]
      art = Artwork.find_by(id: params[:artwork_id])
      art ? (render json: art.comments) : (render text: "You done fucked up")
    else
      render(
        text: "You done fucked up"
      )
    end

  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render(
        json: comment.errors.full_messages, status: 422
      )
    end
  end

  def destroy
    #share = ArtworkShare.find(params[:id])
    comment = Comment.find_by(id: params[:id])
    if comment
      comment.destroy
      render json: comment
    else
      render(
        text: "Could not find comment", status: 404
      )
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end

end
