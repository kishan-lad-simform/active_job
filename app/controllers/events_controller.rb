class EventsController < ApplicationController
  before_action :require_login
  def index
    @events = Event.all
  end

  def participate
    @user = User.find(current_user.id)
    @event = Event.find(params[:id])

    @registration = Registration.new(user: @user, event: @event)
    
    @registration = Registration
      .find_or_initialize_by( user: @user, event: @event )
    
    if @registration.new_record? && @registration.save  
      flash[:success] = "You Registred in these Event."
      redirect_to events_path
    else 
      flash[:notice] = "You already registered in these Event."
      redirect_to events_path
    end
  end
end
