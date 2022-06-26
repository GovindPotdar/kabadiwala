require 'securerandom'

class Users::PasswordsController < ApplicationController

  before_action :user_not_authenticated

  def new
  end

  def create
    user = User.find_by(email:params[:email])
    if user
      set_password_helper_field_value(user,SecureRandom.uuid,DateTime.now)
      PasswordMailer.with(user: user).new_password_email.deliver_later
      redirect_to  root_path, notice:"You will receive an email with instructions on how to reset your password in a few minutes."
    else
      flash[:alert] = "Email not found."
      redirect_back(fallback_location:root_path)
    end

  end

  def edit
    @user = User.find_by(reset_password_token:params[:id])
    if @user
      if @user.reset_password_sent_at < 1.day.ago
        set_password_helper_field_value(@user,nil,nil)
        redirect_to root_path,alert:"Link is expired."
      else
        flash[:notice] = "Please create new password."
      end
    else
      redirect_to root_path,alert:"Link is invalid."
    end
  end

  def update
    @user = User.find_by(reset_password_token:params[:id])
  
    if @user
      @user.password = permit_params[:password]
      @user.password_confirmation = permit_params[:password_confirmation]
      if @user.valid?(:required_to_check)
        @user.save 
        set_password_helper_field_value(@user,nil,nil)
        redirect_to users_sign_in_path,notice:"Password changed successfully ."
      else
        render :edit, status: 422
      end
    else
      redirect_to root_path,alert:"Link is invalid."
    end  
  end

  private
    def permit_params
      params.require(:user).permit(:password,:password_confirmation)
    end

    def set_password_helper_field_value(user,token,datetime)
      user.reset_password_token = token
      user.reset_password_sent_at = datetime
      user.save
    end

end
