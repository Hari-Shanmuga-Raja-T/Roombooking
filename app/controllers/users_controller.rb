class UsersController<ApplicationController
  before_action :authenticate_user!, except: :managerdashboard
  # before_action :check_status, only: [:userroombooking]
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
    @logs = Log.where(user_id: current_user.id).includes(:hotel)
  end
  def roomsearch
    @hotels = Hotel.all
    @key=params[:key]
  end

  private
    def check_status
      @logs=Log.all
      @logs.each do |log|
        if  Date.parse(log.enddate) < Date.today 
          room = Room.find_by(roomid: log.room_id)
          room.update(status: 'Available')
        end
      end
    end
end
