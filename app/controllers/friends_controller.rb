class FriendsController < ApplicationController
  def new
    @friend = Friend.new
    @friend = User.find(params[:username])
  end

  def create
    @friend = Friend.new(friend_params)
    @friend = User.find(params[:username])
    @friend.friend = current_user.friend
    @friend.user = current_user

    if @friend.save!
      redirect_to "/friends"
      flash[:alert] = 'friend successfully added'
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:friend).permit(:user_id)
  end

end
