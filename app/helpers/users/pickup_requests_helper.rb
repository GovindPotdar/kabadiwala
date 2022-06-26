module Users::PickupRequestsHelper

  def show_status(request)
    if request.status == "requested"
      status = '<span class="btn-primary ">requested</span>'
    elsif request.status == "canceled"
      status = '<span class="btn-warning">canceled</span>'
    elsif request.status == "done"
      status = '<span class="btn-success">done</span>'
    else
      status = '<span class="btn-danger">rejected</span>'
    end
    status.html_safe
  end

  def option_to_user(request)
    if request.status == "requested"
      button_to "cancel request",users_cancel_sell_scrap_request_path(request),method: :patch,class:"btn btn-primary",onclick:"return confirm('Are you sure ?')"
    elsif request.status == "done"
      link_to "invoice",rails_blob_path(request.invoice, disposition: :inline),target:"_blank",class:"btn-success"
    else
      ""
    end

  end

end
