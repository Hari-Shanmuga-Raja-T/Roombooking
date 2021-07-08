class Log < ApplicationRecord
   validates :hotel_id,presence: true
   validates :user_id,presence: true
   validates :room_id,presence: true
   validates :startdate,presence: true
   validates :enddate,presence: true
  
   belongs_to :user 
   belongs_to :room

end