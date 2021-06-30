class HotelsController<ApplicationController
    before_action :authenticate_hotel!
    def hotel_history
      @logs = Log.where(hotel_id: current_hotel.id).includes(:user)
    end
end
  