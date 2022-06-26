class SellScrapsController < ApplicationController

  before_action :user_authenticated,only: [:create]

  def index
    @scraps = Scrap.all
  end

  def new
    @pickup_addresses = get_pickup_address if user_signed_in?
    @items = []
    unless params[:scrap]
      flash.now[:alert] = "Please Select Scraps !"
    else
      @items = get_items
      flash.now[:alert] = "No Data Found !" if @items.blank?
    end
  end

  def create
    order = current_user.orders.new(permit_order_params)
    if order.save
      flash[:notice] = "Scrap sell order placed successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "Something went wrong."
      @pickup_addresses = get_pickup_address
      @items = get_items
      render :new,status:422
    end     
  end
    
  def rate_list
    @items = Scrap.includes(:items).all
  end

  private
    def permit_order_params
      params.permit(:pickup_address_id,item_ids:[],images:[])
    end

    def get_items
      scrap_names = params[:scrap].to_a
      items = scrap_names.map do |scrap_name|
        scrap = Scrap.includes(:items).find_by(name:scrap_name)
      end
      .select do |ele|
        ele unless ele.nil?
      end
      items
    end

    def get_pickup_address
      current_user.pickup_addresses
    end

end
