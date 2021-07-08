class Roomtype < ApplicationRecord
    
    validates :AC, presence:true
    validates :beds, presence:true, numericality: {only_integer:true}

    belongs_to :room
end