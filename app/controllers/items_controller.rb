class ItemsController < ApplicationController
  before_action :set_item, only: %i[show]
  # def index
  #   @shop = Shop.find(params[:shop_id])
  #   @items = Item.where(shop_id: @shop.id)
  # end

  def show
    @item = @item.shop
  end

  def new
    @item = Item.new
    @shop = Shop.find(params[:shop_id])
    @festival = Festival.find(params[:festival_id])
  end

  def create
    @item = Item.new(item_params)
    @shop = Shop.find(params[:shop_id])
    @festival = Festival.find(params[:festival_id])
    @item.shop = @shop
    if @item.save!
      # redirect_to festival_shop_path(@festival, @shop)
      redirect_to festival_shop_path(@festival.id, @shop.id)
      flash[:alert] = 'Item was successfully created.'
    else
      render :new
    end
  end

    private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price)
  end
end
