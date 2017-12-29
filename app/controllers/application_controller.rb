class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  # Confirms a logged-in user
  def logged_in_user
    unless logged_in?         # logged_in? -> sessions_helper
      store_location
      #flash[:danger] = "Kamu harus login untuk mengakses halaman ini"
      redirect_to login_url
    end
  end

  # Confirms user not logged in
  def not_logged_in_user
    unless !logged_in?
      flash[:danger] = "Kamu sudah login"
      redirect_to root_path
    end
  end    

  # Confirms the current user
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)    # current_user?(@user) -> sessions_helper
  end

end
