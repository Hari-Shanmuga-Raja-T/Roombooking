class UsersController<ApplicationController
  before_action :authenticate_user!, except: :managerdashboard
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
  def searchallresult
    @key = params[:val]
    # @room = Room.all
    @room = Hotel.where(address: @key).includes(:rooms)
  end
  def userhistory
    @logs = Log.where(user_id: current_user.id).includes(:hotel)
  end
  def roomsearch
    @hotels = Hotel.all
    @key=params[:key]
  end
end
