class FestivalsController < ApplicationController
  before_action :set_festival, only: %i[show edit update destroy]
  def index
    @festivals = Festival.all
  end

  def show; end

  def new
    @festival = Festival.new
  end

  def create
    @festival = Festival.new(festival_params)

    if @festival.save
      redirect_to festivals_path, notice: 'Festival was successfully created.'
    else
      render :new
    end
  end

  def search
    @festivals = Festival.where("name LIKE '%#{params[:query]}%'")
  end

  def edit; end

  def update
    @festival.update(festival_params)
    redirect_to festival_path(@festival)
  end

  def destroy
    @festival.destroy
    redirect_to festivals_path
  end

  private

  def set_festival
    @festival = Festival.find(params[:id])
  end

  def festival_params
    params.require(:festival).permit(:name, :description, :date)
  end
end
