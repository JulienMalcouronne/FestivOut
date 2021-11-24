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

  end
end
