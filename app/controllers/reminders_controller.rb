class RemindersController < ApplicationController
  def index
    @user = current_user

    # @reminders = policy_scope(Reminder)
    @reminders = policy_scope(@user.reminders)

    @reminder = Reminder.new
    # authorize @user

  end

  def new
    @artist = Artist.find(params[:artist_id])
    @reminder = Reminder.new
    @day = Day.find(params[:day_id])
    @festival = Festival.find(params[:festival_id])
    authorize @reminder
    authorize @artist
    authorize @day
    authorize @festival
  end

  def create

    @reminder = Reminder.new
    @reminder.user = current_user
    @day = Day.find(params[:day_id])
    @festival = Festival.find(params[:festival_id])
    @reminder.start_time = Time.now
    @reminder.end_time = params[:end_time]
    @artist = Artist.find(params[:artist_id])
    @reminder.artist = @artist
    # authorize @artist
    authorize @reminder
    # authorize @day
    # authorize @festival
    if @reminder.save
      redirect_to "/"
      flash[:alert] = 'reminder successfully added'
    else
      render :home
    end
  end
end
