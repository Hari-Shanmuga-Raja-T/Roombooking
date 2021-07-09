class BookingMailer < ApplicationMailer

    def new_booking_email
        @booking = params[:booking] 
        mail(to: @booking.hotel.email,subject: "You got a booking!!")
    end

    def cancel_booking_by_user_email
        @booking = params[:booking]
        mail(to: @booking.hotel.email,subject: "Booking is canceled!!")
    end

    def cancel_booking_by_hotel_email
        @booking = params[:booking]
        mail(to: @booking.user.email,subject: "Booking is canceled!!")
    end
end
