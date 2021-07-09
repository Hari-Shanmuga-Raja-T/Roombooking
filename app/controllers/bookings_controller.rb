class BookingsController<ApplicationController
    def create
        booking = Booking.new
        room=Room.find_by(id:params[:room_id])
        hotelid = room.hotel.id
        booking.hotel_id = hotelid
        booking.user_id = params[:user_id]
        booking.room_id = params[:room_id]
        booking.startdate = params[:startdate]
        booking.enddate = params[:enddate]
        respond_to do |format|
            if booking.save
                BookingMailer.with(booking: booking).new_booking_email.deliver_now
                format.html { redirect_to users_bookings_path, notice: "Successfully booked"}
            else
                format.html { redirect_to request.referrer , notice: booking.errors.full_messages}
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
                if user_signed_in?
                    BookingMailer.with(booking: booking).cancel_booking_by_user_email.deliver_now
                    format.html { redirect_to users_bookings_path, notice: "Booking canceled"}
                else
                    BookingMailer.with(booking: booking).cancel_booking_by_hotel_email.deliver_now
                    format.html { redirect_to hotels_bookings_path, notice: "Booking canceled"}
                end
            else
                if user_signed_in?
                    format.html { redirect_to users_userroombooking_path(Hotel.find_by(id: hotelid)) , notice: "Failed"}
                else
                    format.html { redirect_to hotels_bookings_path , notice: "Failed"}
                end
            end
        end
    end

end