class SessionsController < ApplicationController

  def new
  end

  def create
    # log in via Bialowieza user account
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome back #{@user.name.capitalize}!"
    else
      flash[:notice] = "Incorrect email or password. Please try logging in again."
      render 'sessions/new' # login_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "You have successfully logged out."
  end
end
