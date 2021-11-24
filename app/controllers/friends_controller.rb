class FriendsController < ApplicationController
  def new
    @friend = Friend.new
    authorize @friend
  end

  def create
    # @friend = Friend.new(friend_params)
    @friend = Friend.new
    @friend.friend = User.where(username: params[:friend][:username]).first
    @friend.user = current_user
    authorize @friend
    if @friend.save!
      redirect_to "/friends"
      flash[:alert] = 'friend successfully added'
    else
      render :new
    end
  end

  def index
    @user = current_user
    # @friends = @user.friends
    @friends = policy_scope(@user.friends)
    # @friends = policy_scope(Friend)
    @friend = Friend.new
    # authorize @friend
  end

  private

  def friend_params
    params.require(:friend).permit(:username)
  end

end
