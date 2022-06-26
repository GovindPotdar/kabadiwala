class Scrap < ApplicationRecord

    has_many :items

    validates :name, uniqueness: true
end
