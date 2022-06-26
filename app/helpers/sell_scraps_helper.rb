module SellScrapsHelper

  def pickup_address_checked(index,address,pickup_address_id)
    p pickup_address_id
    if pickup_address_id.nil?
      "checked" if index == 0
    else
      "checked" if address.id == pickup_address_id.to_i
    end
  end

end
