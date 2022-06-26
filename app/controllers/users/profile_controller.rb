class Users::ProfileController < ApplicationController

  before_action :user_authenticated
  
  def index
    @pickup_addresses = current_user.pickup_addresses
    @user = current_user
  end

  def change_avatar
    avatar = current_user.update(permit_avatar)
    if avatar
      flash[:notice]= "Avatar changed successfully."
    else
      flash[:alert] = "Failed to changed."
    end

    redirect_back(fallback_location: root_path)
  end
  
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(permit_user_details)
      redirect_to users_profile_index_path,notice: "Details updated successfully."
    else
      render :edit,status:422
    end
  end

  private
    def permit_avatar
      params.require(:user).permit(:avatar)
    end

    def permit_user_details
      params.require(:user).permit(:full_name,:mobile_number,:email)
    end

end
