class ApplicationController < ActionController::Base

  def user_authenticated
    if !user_signed_in?
      redirect_to root_path , alert: "Sign up or Sign in first."
    end
  end

  def admin_authenticated
    if !user_signed_in? || current_user.role != "admin"
      redirect_to root_path , alert: "You don't have access to this page."
    end
  end


  def user_not_authenticated
    if user_signed_in?
      redirect_to root_path , alert: "Already Signed in."
    end
  end

  private 

    helper_method :user_signed_in?, :current_user, :maximum_pickup_addresses_reached?, :is_admin?

    def user_signed_in?
      !session[:user_id].nil?
    end

    def is_admin?
      current_user.role == "admin"
    end


    def current_user
      if user_signed_in?
        User.find session[:user_id]
      end
    end

    def maximum_pickup_addresses_reached?
      current_user.pickup_addresses.count >= 3
    end


end