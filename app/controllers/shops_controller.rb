class ShopsController < ApplicationController

  before_action :set_shop, only: %i[show]
  def index
    @shops = Shop.all
  end

  def show
    @festival = @shop.festival
  end

  def new
    @shop = Shop.new
    @festival = Festival.find(params[:id])
  end

  def create
    @shop = Shop.new(shop_params)
    @festival = Festival.find(params[:id])
    @shop.festival = @festival
    if @shop.save!
      # redirect_to festival_shop_path(@festival, @shop)
      redirect_to festivals_path
      flash[:alert] = 'Shop was successfully created.'
    else
      render :new
    end
  end

    private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :festival_id)
  end
end
