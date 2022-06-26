class Users::PickupAddressesController < ApplicationController

  before_action :maximum_pickup_addresses_reached, only:[:new,:create]
  before_action :user_authenticated
  before_action :user_pickup_address, only:[:edit,:update]
  def new
    p request.original_fullpath 
    @pickup_address = PickupAddress.new
  end

  def create
    @pickup_address = current_user.pickup_addresses.new(permit_pickup_address_params)
    if @pickup_address.save
      flash[:notice] = "Pickup address successfully created."
      redirect_to users_profile_index_path
    else
      render :new, status: 422
    end
  end
  
  def edit
    flash.now[:alert] = "Updating address can affect the pickup location if you selected this one for any scrap sell."
    render :edit
  end

  def update
    if @pickup_address.update(permit_pickup_address_params)
      flash[:notice] = "Pickup address successfully updated."
      redirect_to users_profile_index_path
    else
      render :edit, status: 422
    end
  end

  private 
    def permit_pickup_address_params
      params.require(:pickup_address).permit(:city_id,:address)
    end

    def maximum_pickup_addresses_reached
      if maximum_pickup_addresses_reached?
        flash[:alert] = "Maximum pickup addresses already added."
        redirect_back(fallback_location: root_path)
      end
    end

    def user_pickup_address
      @pickup_address = current_user.pickup_addresses.find_by(id:params[:id])
      if @pickup_address.nil?
        flash[:alert] = "Wrong address to update."
        redirect_back(fallback_location: root_path)        
      end

    end

end
