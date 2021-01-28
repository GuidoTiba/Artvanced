class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
  end

  def new
    @artwork = Artwork.new
  end
 
  def create
    @artwork = Artwork.new(artwork_params)
     @artwork.user = current_user
    if @artwork.save
      redirect_to artworks_path(@artwork)
    else
      render :new
    end
  end
 
  private
 
  def artwork_params
    params.require(:artwork).permit(:title, :technique, photos:[])
  end

end
