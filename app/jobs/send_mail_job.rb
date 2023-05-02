class SendMailJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    @user = User.find(user_id)
    UserMailer.welcome_mail(@user).deliver_now
  end 
end
