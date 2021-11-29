class RemindersController < ApplicationController
  def index
    @user = current_user
    @reminders = policy_scope(Reminder)
  end
end
