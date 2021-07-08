class Discount < ApplicationRecord

    validates :percentage, numericality: { only_integer: true }

    belongs_to :hotel
    
end