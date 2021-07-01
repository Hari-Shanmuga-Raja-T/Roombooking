class Room < ApplicationRecord
    validates :roomid, presence: true, uniqueness: true
    validates :hotel_id, presence: true
    validates :roomno, presence: true
    validates :status, presence: true
    validates :price, presence: true, numericality: { only_integer: true }
    validates :roomtype, presence: true
    belongs_to :hotel
end
