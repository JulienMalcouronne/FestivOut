class RemindersController < ApplicationController
  def index
    @user = current_user

    # @reminders = policy_scope(Reminder)
    @reminders = policy_scope(@user.reminders)
    @reminder = Reminder.new
    # authorize @user
  end

  def new
    @reminder = Reminder.new
    authorize @reminder
  end

  def create
    @reminder = Reminder.new
    @reminder.user = current_user
    @reminder.start_time = Time.now
    @reminder.end_time = params[:end_time]
    authorize @reminder
    if @reminder.save
      redirect_to "/"
      flash[:alert] = 'reminder successfully added'
    else
      render :home
    end
  end
end
