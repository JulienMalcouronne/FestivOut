class FriendsController < ApplicationController
  before_action :set_friend, only: %i[confirm refuse]
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
    if @friend.save
      redirect_to "/friends"
      flash[:alert] = 'friend successfully added'
    else
      @user = current_user
      @friends = policy_scope(@user.friends)
      render :index
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

  def confirm
    @friend.update(status: "accepted")
    # redirect_to "/friends?tab=pending"
    redirect_to friends_path(tab: 'pending')
  end

  def refuse
    @friend.update(status: "canceled")
    redirect_to "/friends"
  end

  private

  def friend_params
    params.require(:friend).permit(:username)
  end

  def set_friend
    @friend = Friend.find(params[:id])
    authorize @friend
  end

end
