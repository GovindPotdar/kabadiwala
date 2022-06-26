class User < ApplicationRecord
  has_secure_password
  
  enum :role,[:user,:admin]
  has_one_attached :avatar
  has_many :pickup_addresses
  has_many :orders
  # validations
  validates :full_name,:email,:mobile_number,presence:true
  validates :password,length: {in:6..20}, on: [:create,:required_to_check]
  validates :mobile_number,length: {minimum:10,maximum:12}
  validates :email,uniqueness: true
  validate :validate_avatar, on: :update

  private 
    def validate_avatar
      return unless avatar.attached?

      unless avatar.blob.byte_size <= 3.megabyte
        errors.add(:avatar," is too big")
      end
      
      unless ["image/png","image/jpg","image/jpeg"].include? avatar.content_type 
        errors.add(:avatar," should be png/jpg/jpeg")
      end

    end

end
