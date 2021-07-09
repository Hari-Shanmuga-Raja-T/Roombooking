class Log < ApplicationRecord
   validates :hotel_id,presence: true
   validates :user_id,presence: true
   validates :room_id,presence: true
   validates :startdate,presence: true
   validates :enddate,presence: true
  
   belongs_to :user 
   belongs_to :room
   belongs_to :hotel

   after_save:updatestatus

   def updatestatus
      self.room.update(status: 'Available')
   end

end