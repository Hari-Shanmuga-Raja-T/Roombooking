class Log < ApplicationRecord
   validates :hotel_id,presence: true
   validates :user_id,presence: true
   validates :room_id,presence: true
   validates :startdate,presence: true
   validates :enddate,presence: true
   validate :date_validation
  
   belongs_to :hotel
   belongs_to :user 
   after_save :updatestatus

   private
     def updatestatus
        room = Room.find_by(roomid: $Rid)
        room.update(status: 'Not available')
     end

     def date_validation
      if  Date.parse(startdate) < Date.today or Date.parse(startdate) > Date.parse(enddate)
         self.errors.add(:date,:must_valid,message: "Invalid Start and end date")
      end
     end

end
# class Post < ApplicationRecord
#   validate :custom_validation
#   private def custom_validation
#     if ! (valid...)
#       self.errors[:base] << "Custom error message"
#     end
#   end
# end