class BookingsController<ApplicationController
    after_action :updatestatus, only: [:create]
    def create
        booking = Booking.new
        $Rid = params[:room_id]
        room=Room.find_by(id:params[:room_id])
        hotelid = room.hotel.id
        booking.hotel_id = hotelid
        booking.user_id = params[:user_id]
        booking.room_id = params[:room_id]
        booking.startdate = params[:startdate]
        booking.enddate = params[:enddate]
        respond_to do |format|
            if booking.save
                format.html { redirect_to users_userhome_path , notice: "Successfully booked"}
            else
                format.html { redirect_to users_userhome_path , notice: booking.errors.full_messages}
            end
        end
    end 

    def delete
        booking=Booking.find_by(id:params[:booking_id])
        roomid=booking.room_id
        respond_to do |format|
            if booking.destroy
                room = Room.find_by(id:roomid)
                room.update(status:"Available")
                format.html { redirect_to users_userhome_path , notice: "Booking canceled"}
            else
                format.html { redirect_to users_userroombooking_path(Hotel.find_by(id: hotelid)) , notice: "Failed"}
            end
        end
    end

    private
    def updatestatus
        if !$Rid.nil?
           room = Room.find_by(id: $Rid)
           room.update(status: 'Not available')
        end
    end

end