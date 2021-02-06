class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show, :toggle_sale, :edit, :update]

  def index
    if Artwork::TECHNIQUES.include?(params[:technique])
      @artworks = Artwork.where(technique: params[:technique], on_sale: true)
      @title = params[:technique].capitalize
    else
      @artworks = Artwork.all.where(on_sale: true)
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

  def edit
  end

  def update
    @artwork.update(artwork_params)
    redirect_to user_artworks_path(current_user)
  end

  def my_artworks
    @artworks = Artwork.all.select { |artwork| artwork.owner == current_user }
  end

  def toggle_sale
    if @artwork.on_sale
      @artwork.update(on_sale: false)
    else
      @artwork.update(on_sale: true)
    end
    redirect_to user_artworks_path(current_user)
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :technique, :price, photos:[], :description)
  end

  def set_artwork
    @artwork = Artwork.find(params[:id])
    # Aca cambie artwork_id por solo :id ya que con el primero, no funcionaba el show.
    # Puede esto traer problemas para otro metodos? Cual es la forma correcta de ponerlo?
  end
end
