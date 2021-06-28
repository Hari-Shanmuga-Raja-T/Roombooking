class Log < ApplicationRecord
   validates :hotel_id,presence: true
   validates :user_id,presence: true
   validates :room_id,presence: true
   validates :startdate,presence: true
   validates :enddate,presence: true
  
   belongs_to :hotel
   belongs_to :user 
   after_save :updatestatus

   private
     def updatestatus
        room = Room.find_by(roomid: $Rid)
        room.update(status: 'Not available')
     end

end
