class Users::RegistrationsController < ApplicationController

  before_action :user_not_authenticated, only: [:new,:create]

  def new
    @user = User.new
  end


  def create
    @user = User.new permit_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Signed up successfully and Sign in too."
    else
      render :new, status: :unprocessable_entity
    end

  end

  private
    def permit_params
      params.require(:user).permit(:full_name,:mobile_number,:email,:password,:password_confirmation)
    end

end
