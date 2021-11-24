class PointOfInterestsController < ApplicationController
  before_action :set_point_of_interest, only: %i[show]
  def index
    @point_of_interests = policy_scope(PointOfInterest)
    @festival = Festival.find(params[:festival_id])
  end

  def show
    @festival = Festival.find(params[:festival_id])
    @point_of_interest = PointOfInterest.find(params[:id])
    @markers = [
      {
        lat: @point_of_interest.latitude,
        lng: @point_of_interest.longitude,
        info_window: render_to_string(partial: "info_window", locals: { point_of_interest: @point_of_interest }),
        image_url: helpers.asset_url("outlogo.png")
      }]
    authorize @point_of_interest
  end

  private

  def set_point_of_interest
    @point_of_interest = PointOfInterest.find(params[:id])
  end

  def point_of_interest_params
    params.require(:point_of_interest).permit(:name, :description, :festival_id, :address)
  end
end
