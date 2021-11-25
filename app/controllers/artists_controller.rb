class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show]

  def show
    @artist = @artist.day
  end

  def new
    @artist = Artist.new
    @day = Shop.find(params[:shop_id])
    @festival = Festival.find(params[:festival_id])
  end

  def create
    @artist = Artist.new(item_params)
    @day = Shop.find(params[:shop_id])
    @festival = Festival.find(params[:festival_id])
    @artist.day = @day
    if @artist.save!
      # redirect_to festival_shop_path(@festival, @day)
      redirect_to festival_day_path(@festival.id, @day.id)
      flash[:alert] = 'Artist was successfully created.'
    else
      render :new
    end
  end

    private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :start_time, :finish_time)
  end
end
