class PickupAddress < ApplicationRecord
  belongs_to :user
  belongs_to :city

  validates :address,presence: true

  
end
