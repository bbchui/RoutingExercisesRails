class ArtworksController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render json: user.artworks + user.shared_artworks
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render(
        json: artwork.errors.full_messages, status: 422
      )
    end
  end

  def show
    if artwork = Artwork.find(params[:id])
      render json: artwork
    else
      render(
        json: artwork.errors.full_messages, status: 422
      )
    end
  end

  def update
    artwork = Artwork.update(params[:id], artwork_params)
    if artwork
      render json: artwork
    else
      render(
        json: artwork.errors.full_messages, status: 422
      )
    end
  end

  def destroy
    artwork = Artwork.find(params[:id]).destroy
    if artwork
      render json: artwork
    else
      render(
        json: artwork.errors.full_messages, status: 422
      )
    end
  end



  private

  def artwork_params
    params[:artworks].permit(:artist_id, :title, :image_url)
  end
end
