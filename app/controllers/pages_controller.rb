class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def friends
    @user = current_user
    @friends = @user.friends
    @friend = Friend.new
  end

  def map
       @shops = policy_scope(Shop)
      @markers = @shops.geocoded.map do |shop|
    {
      lat: shop.latitude,
      lng: shop.longitude,
      info_window: render_to_string(partial: "shops/info_window", locals: { shop: shop })
    }
    end
      @point_of_interests = policy_scope(PointOfInterest)
        @interests = @point_of_interests.geocoded.map do |point_of_interest|
      {
        lat: point_of_interest.latitude,
        lng: point_of_interest.longitude,
        info_window: render_to_string(partial: "point_of_interests/info_window", locals: { point_of_interest: point_of_interest }),
        # image_url: helpers.asset_url("outlogo.png")
      }
    end
  end
end
