class Admin::OrdersController < ApplicationController

  before_action :admin_authenticated
  before_action :get_order_and_is_order_status_requested,only:[:reject,:done]
  def index
    if params[:order_id].nil?
      filter = params[:filter].nil? ? "requested" : params[:filter]
      @orders = Order.where(status:filter).limit(100)
    else
      @orders = Order.where(id:params[:order_id])
    end
  end

  def show
    @order = Order.find_by(id:params[:id])
  end

  def reject
    @order.rejected!
    flash[:notice] = "scrap sell request rejected."
    redirect_to admin_orders_path, status: :see_other
  end

  def done
    data = render_to_string "admin/orders/invoice",locals:{object:@order,total_amount:params[:total_amount]}, layout:false
    pdf = WickedPdf.new.pdf_from_string(data)
    pdf = StringIO.new(pdf)
    @order.invoice.attach(
      io: pdf,
      filename: "order-#{@order.id}.pdf",
      content_type: 'application/pdf',
      identify: false
    )
    @order.done!
    redirect_to admin_orders_path, notice:"Invoice generated successfully."
  end

  private
    def get_order_and_is_order_status_requested
      @order = Order.find_by(id:params[:order_id])
      if @order.nil? || @order.status != "requested"
        flash[:alert] = "something went wrong."
        redirect_back(fallback_location:root_path)
      end
    end
    
  
end
