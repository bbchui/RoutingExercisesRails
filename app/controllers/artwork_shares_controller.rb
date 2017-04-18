class ArtworkSharesController < ApplicationController

  def create
    share = ArtworkShare.new(artwork_share_params)
  # replace the `user_attributes_here` with the actual attribute keys
    if share.save
      render json: share
    else
      render(
        json: share.errors.full_messages, status: 422
      )
    end
  end

  def destroy
    #share = ArtworkShare.find(params[:id])
    share = ArtworkShare.find_by(id: params[:id])
    if share
      share.destroy
      render json: share
    else
      render(
        text: "Could not find artwork share", status: 404
      )
    end
  end

  def artwork_share_params
    params[:share].permit(:artwork_id, :viewer_id)
  end
end
