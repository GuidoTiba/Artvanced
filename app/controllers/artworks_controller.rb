class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show]

  def index
    if Artwork::TECHNIQUES.include?(params[:technique])
      @artworks = Artwork.where(technique: params[:technique])
      @title = params[:technique].capitalize
    else
      @artworks = Artwork.all
      @title = "All Artwork"
    end
  end

  def show
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.author = current_user
    if @artwork.save
      redirect_to artworks_path(@artwork)
    else
      render :new
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :technique, :price, photos:[])
  end

  def set_artwork
    @artwork = Artwork.find(params[:id])
    # Aca cambie artwork_id por solo :id ya que con el primero, no funcionaba el show.
    # Puede esto traer problemas para otro metodos? Cual es la forma correcta de ponerlo?
  end
end
