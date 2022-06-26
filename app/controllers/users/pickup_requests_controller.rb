class Users::PickupRequestsController < ApplicationController
  before_action :user_authenticated

  def index
    @requests = current_user.orders.order(id: :desc).last(30)
  end

  def cancel_sell_scrap_request
    order = current_user.orders.find_by(id:params[:id])
    if order
      order.canceled!
      flash[:notice] = "scrap sell request ##{order.id} canceled successfully."
    else
      flash[:alert] = "Something went wrong try again."
    end
    redirect_back(fallback_location:root_path)
  end

  def show
    @request =  current_user.orders.find_by(id:params[:id])
    if !@request
      flash[:alert] = "Something went wrong try again."
      redirect_back(fallback_location:root_path)
    end
  end


end
