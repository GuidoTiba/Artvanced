class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:buy]

  def index
    @artworks = Artwork.all
  end
  
  def buy
    purchase = Purchase.create(artwork: @artwork, buyer: current_user)
    redirect_to artworks_path
  end

  def set_artwork
    @artwork = Artwork.find(params[:artwork_id])
  end
end
