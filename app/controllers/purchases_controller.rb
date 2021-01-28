class PurchasesController < ApplicationController

  def buy
    purchase = Purchase.create(artwork: @artwork, buyer: current_user)
    redirect_to artworks_path
  end

  private

  def set_artwork
    @artwork = Artwork.find(params[:artwork_id])
  end
end
