class UsersController < ApplicationController
  before_action :require_login, only: [ :index, :logout, :destroy ]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      SendMailJob.perform_now(@user.id)
      SendEmployeeMailJob.set(wait: 2.minutes).perform_later(@user.id) 
      redirect_to users_path
    else
      render :new, status: 422
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def check_login; end

  def login 
    @user = User.find_by(email: params[:email])
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      redirect_to users_path, notice: "Login sucessfully..."
    else
      flash[:notice] = "Invalid login...."
      redirect_to login_path
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "You logout... :)"
    redirect_to login_path
  end

  private
    def user_params
      params.require(:user).permit( :name, :email, :contact, :password )
    end
end
