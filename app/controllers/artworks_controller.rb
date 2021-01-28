class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:buy, :show]

  def index
    @artworks = Artwork.all
  end

  def show
  end

  def buy
    purchase = Purchase.create(artwork: @artwork, buyer: current_user)
    redirect_to artworks_path
  end

  private

  def set_artwork
    @artwork = Artwork.find(params[:id])
    # Aca cambie artwork_id por solo :id ya que con el primero, no funcionaba el show.
    # Puede esto traer problemas para otro metodos? Cual es la forma correcta de ponerlo?
  end
end
