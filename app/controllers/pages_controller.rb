class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user_friends = (current_user.friends.where(status: "accepted") + current_user.friend_requests.where(status: "accepted")).uniq if current_user
  end

  def friends
    @user = current_user
    @friends = @user.friends
    @friend = Friend.new
  end

  # def notification
  #   @user = current_user
  #   @friends = @user.friends
  #   @friend = Friend.new
  # end

  def map
       @shops = policy_scope(Shop)
      @markers = @shops.geocoded.map do |shop|
    {
      lat: shop.latitude,
      lng: shop.longitude,
      info_window: render_to_string(partial: "shops/info_window", locals: { shop: shop }),
      image_url: helpers.asset_url("burgerz.png")
    }
    end
      @point_of_interests = policy_scope(PointOfInterest)
        @interests = @point_of_interests.geocoded.map do |point_of_interest|
          if point_of_interest.name == "Gaudelet" || point_of_interest.name == "Le Perchoir" || point_of_interest.name == "La Rotonde"
      {
        lat: point_of_interest.latitude,
        lng: point_of_interest.longitude,
        info_window: render_to_string(partial: "point_of_interests/info_window", locals: { point_of_interest: point_of_interest }),
        image_url: helpers.asset_url("music-note.png")
      }
          elsif point_of_interest.name == "Toilette"
          {
        lat: point_of_interest.latitude,
        lng: point_of_interest.longitude,
        info_window: render_to_string(partial: "point_of_interests/info_window", locals: { point_of_interest: point_of_interest }),
        image_url: helpers.asset_url("toilets.png")
        }

          elsif point_of_interest.name == "Exit"
           {
        lat: point_of_interest.latitude,
        lng: point_of_interest.longitude,
        info_window: render_to_string(partial: "point_of_interests/info_window", locals: { point_of_interest: point_of_interest }),
        image_url: helpers.asset_url("star.png")
        }

          elsif point_of_interest.name == "Entry"
        {
        lat: point_of_interest.latitude,
        lng: point_of_interest.longitude,
        info_window: render_to_string(partial: "point_of_interests/info_window", locals: { point_of_interest: point_of_interest }),
        image_url: helpers.asset_url("star.png")
        }
          end
    end

      friend_ids = Friend.where("user_id = ? OR friend_id = ?", current_user.id, current_user.id).pluck(:user_id, :friend_id)
                         .flatten
                         .uniq
                         .reject { |id| id == current_user.id }
      @users = User.where(id: friend_ids)

      @users = @users.map do |user|
          if user.avatar.attached?
          {
            lat: user.latitude,
            lng: user.longitude,
            info_window: render_to_string(partial: "pages/info_window", locals: { user: user }),
            image_url: helpers.cloudinary_url(user.avatar.key)
          }
          else
          {
            lat: user.latitude,
            lng: user.longitude,
            info_window: render_to_string(partial: "pages/info_window", locals: { user: user }),
            image_url: helpers.asset_url("guest.png")
          }
          end
    end
  end
end
