class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user         # method helper sessions
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_path 
    else
      flash.now[:danger] = 'Invalid username/pasword combination'
      render 'new'
    end
  end

  def destroy
    log_out   #method helper session
    redirect_to login_url 
  end
end
