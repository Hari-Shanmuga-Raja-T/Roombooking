class UsersController<ApplicationController
  #before_action :authenticate_user!
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
  end
  def roomsearch
    @hotels = Hotel.all
    @key=params[:key]
  end
end
