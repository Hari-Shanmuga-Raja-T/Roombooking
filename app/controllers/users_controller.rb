class UsersController<ApplicationController
  def managerdashboard
  end
  def userhome
    @hotels=Hotel.all
  end
  def userroombooking
    @room = Room.find(params[:id])
  end
end
