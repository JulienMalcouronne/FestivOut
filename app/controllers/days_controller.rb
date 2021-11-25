class DaysController < ApplicationController
  before_action :set_day, only: %i[show]
  def index
    @days = policy_scope(Day)
    @festival = Festival.find(params[:festival_id])
  end

  def show
    @festival = Festival.find(params[:festival_id])
    @day = Day.includes(:artists).find(params[:id])

    authorize @day
  end

  def new
    @day = Day.new
    @festival = Festival.find(params[:festival_id])
  end

  def create
    @day = Day.new(day_params)
    @festival = Festival.find(params[:festival_id])
    @day.festival = @festival
    if @day.save!
      redirect_to festivals_path
      flash[:alert] = 'Day was successfully created.'
    else
      render :new
    end
  end

    private

  def set_day
    @day = Day.find(params[:id])
  end

  def day_params
    params.require(:day).permit(:name, :festival_id)
  end
end
