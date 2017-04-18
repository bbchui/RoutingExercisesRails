class LikesController < ApplicationController
  def index
    if params[:likeable_type] == 'comment'
      query = params[:likeable_id]
      comment = Comment.find_by(id: query)
      render json: comment.likes
    elsif params[:likeable_type] == 'artwork'
      query = params[:likeable_id]
      artwork = Artwork.find_by(id: query)
      render json: artwork.likes
    end
  end

  def create
    like = Like.new(like_params)
    # replace the `user_attributes_here` with the actual attribute keys
    if like.save
      render json: like
    else
      render(
        json: like.errors.full_messages, status: 422
      )
    end
  end



  private

  def like_params
    params.permit(:likeable_id, :likeable_type, :user_id)
  end
end
