class FriendsController < ApplicationController
  def new
    @friend = Friend.new
  end

  def create
    # @friend = Friend.new(friend_params)
    @friend = Friend.new
    @friend.friend = User.where(username: params[:friend][:username]).first
    @friend.user = current_user

    if @friend.save!
      redirect_to "/friends"
      flash[:alert] = 'friend successfully added'
    else
      render :new
    end
  end

  private

  def friend_params
    params.require(:friend).permit(:username)
  end

end
