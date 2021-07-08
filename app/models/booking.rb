class Booking < ApplicationRecord

    belongs_to :user
    belongs_to :hotel
    belongs_to :room
    
    validates :startdate,presence: true
    validates :enddate,presence: true
    validate :date_validation

    private

     def date_validation
      if  startdate < Date.today or startdate > enddate
         self.errors.add(:startdate,:must_valid,message: "Invalid Start and end date")
      end
     end
end