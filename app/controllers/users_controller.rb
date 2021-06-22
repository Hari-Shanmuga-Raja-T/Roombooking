class UsersController<ApplicationController
  def managerdashboard
  end
  def userhome
    @hotels=Hotel.all
  end
  def userroombooking
    @room = Room.all
    @hotel_id = params[:id]
    @t = Room.find_by(hotel_id: @hotel_id , status: 'Available')
  end
  def userhistory
    @logs = Log.all
    if hotel_signed_in?
      @temp = Log.find_by(hotel_id: current_hotel.id)
    end
    if user_signed_in?
      @temp = Log.find_by(hotel_id: current_user.id)
    end
  end
  def roomsearch
    @hotels = Hotel.all
    @key=params[:key]
  end
end
