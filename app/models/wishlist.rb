class Wishlist < ApplicationRecord

    validates :user_id, presence:true
    validates :room_id, presence:true

    belongs_to :user
    belongs_to :room
    
end