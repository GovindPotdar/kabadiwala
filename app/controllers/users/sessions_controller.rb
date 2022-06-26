class Users::SessionsController < ApplicationController
  
  before_action :user_authenticated, only:[:destroy]
  before_action :user_not_authenticated, only: [:new,:create]
  
  def new
  end

 
  def create
    user = User.find_by(email:params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Sign in successfully."
    else
      flash[:alert] = "Wrong email or password."
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Sign out successfully.", status: :see_other
  end


end
