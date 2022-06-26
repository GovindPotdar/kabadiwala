class City < ApplicationRecord

  enum :service,[:available,:unavailable]
  
end
