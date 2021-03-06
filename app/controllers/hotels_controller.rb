class HotelsController<ApplicationController

    before_action :authenticate_hotel!

    helper_method :full_name

    def hotel_history
      @logs=current_hotel.logs
    end

    def all_user
      @user = current_hotel.users
      respond_to do |format|
        format.html
        format.csv { send_data @user.to_csv}
      end
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
    
    def full_name(user)
      return user.firstname+" "+user.lastname
    end
end
  