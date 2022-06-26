class Order < ApplicationRecord
  belongs_to :pickup_address
  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_and_belongs_to_many :items, dependent: :destroy

  has_one_attached :invoice
  
  enum :status,[:requested,:canceled,:done,:rejected]
  

end 
