class PurchasesController < ApplicationController
  before_action :set_artwork, only: [:create, :new]
  after_action :buy_confirmed, only: [:create]

  def create
    @purchase = Purchase.new(artwork: @artwork, buyer: current_user, buyingprice: @artwork.price)
    if @purchase.save
      redirect_to artworks_path
    else
      redirect_to artworks_path, alert: "Purchase was not completed, please try again"
    end
  end

  def new
    @purchase = Purchase.new
  end

  def index
    @purchases = Purchase.all
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  # usar callback: after create
  private

  def set_artwork
    @artwork = Artwork.find(params[:artwork_id])
  end

  def buy_confirmed
    flash.alert = "You have succesfully bought the Artwork. Congratulations!!"
  end
end
