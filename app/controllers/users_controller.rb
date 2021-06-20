class UsersController<ApplicationController
  def managerdashboard
  end
  def userhome
    @hotels=Hotel.all
  end
  def userroombooking
    @room = Room.all
    @hotel_id = params[:id]
  end
  def userhistory
    @logs = Log.all
  end
  def roomsearch
    @hotels = Hotel.all
    @key=params[:key]
  end
end
