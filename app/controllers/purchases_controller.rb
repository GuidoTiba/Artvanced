class PurchasesController < ApplicationController
  before_action :set_artwork, only: [:create]

  def create
    purchase = Purchase.new(artwork: @artwork, buyer: current_user)
    if purchase.save
      redirect_to artworks_path
    else
      redirect_to artworks_path, alert: "Purchase was not completed, please try again"
    end
  end

  # usar callback: after create

  private

  def set_artwork
    @artwork = Artwork.find(params[:artwork_id])
  end
end
