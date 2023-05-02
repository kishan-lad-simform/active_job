class NotifyMailer < ApplicationMailer
  def notify_mail
    users = params[:users]
    event = params[:event]
    mail( 
      to: users, 
      subject: "Notify for Event"
    )
  end

 
end
