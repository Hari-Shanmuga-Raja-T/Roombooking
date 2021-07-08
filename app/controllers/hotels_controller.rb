class HotelsController<ApplicationController
    before_action :authenticate_hotel!
    def hotel_history
      @logs=current_hotel.logs
    end
    def booking_list
      @lists = current_hotel.bookings
    end
    def add_discount
      @discount=Discount.find_by(hotel_id: current_hotel.id)
      if @discount.nil?
          @discount=Discount.new
      end
  end
end
  