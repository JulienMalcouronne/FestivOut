class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def friends
    @user = current_user
    @friends = @user.friends
    @friend = Friend.new
  end
end
