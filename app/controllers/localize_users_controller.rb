class LocalizeUsersController < ApplicationController

  def update
    @user = User.find(params[:id])
    authorize @user
    @user.update!(latitude: params[:latitude], longitude: params[:longitude])
  end
end
