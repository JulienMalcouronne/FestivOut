class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @festival = Festival.find(params[:festival_id])
    authorize @chatroom
  end

  def index
    @chatrooms = policy_scope(Chatroom)
    @festival = Festival.find(params[:festival_id])
  end
end
