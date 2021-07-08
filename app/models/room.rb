class Room < ApplicationRecord

    validates :roomid, presence: true, uniqueness: true
    validates :hotel_id, presence: true
    validates :roomno, presence: true
    validates :status, presence: true
    validates :price, presence: true, numericality: { only_integer: true }
    
    belongs_to :hotel
    has_one :roomtype, dependent: :destroy
    has_one :booking
    has_many :logs , dependent: :destroy
    has_one :wishlist

    def self.to_csv
        CSV.generate do |var|
          var << column_names
          all.each do |room|
            var << room.attributes.values_at(*column_names)
          end
        end
    end

end
