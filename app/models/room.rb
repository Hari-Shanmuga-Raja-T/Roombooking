class Room < ApplicationRecord
    validates :roomid, presence: true
    validates :hotelid, presence: true
    validates :roomno, presence: true
    validates :status, presence: true
    validates :price, presence: true
    validates :roomtype, presence: true
    belongs_to :hotel , optional: true
end
