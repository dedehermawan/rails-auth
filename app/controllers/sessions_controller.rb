class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user         # method helper sessions
      redirect_to user
    else
      flash.now[:danger] = 'Invalid username/pasword combination'
      render 'new'
    end
  end

  def destroy
    log_out   #method helper session
    redirect_to root_url
  end
end
