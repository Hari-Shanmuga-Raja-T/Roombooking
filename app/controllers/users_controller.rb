class UsersController<ApplicationController

  before_action :authenticate_user!, except: [:managerdashboard]
  before_action :updatelog , only: [:userhistory]

  helper_method :update_price
  helper_method :full_name

  def managerdashboard
  end


  def userhome
    @hotels=Hotel.all
  end

  def userroombooking
    @room = Room.where(hotel_id:params[:id],status: 'Available')
  end

  def userhistory
    @logs = Log.where(user_id: current_user.id)
  end

  def roomsearch
    @hotels = Hotel.where(address: params[:key])
  end

  def booking_list
    @lists = current_user.bookings
  end

  def wish_list
    @list=current_user.wishlists
  end

  def update_price(room)
    price = room.hotel.discount.percentage.to_f/100
    price = price * (room.price).to_f
    amount = room.price.to_f - price
    return amount
  end

  def full_name(user)
    return user.firstname+" "+user.lastname
  end

  private
  
    def updatelog
      bookings=current_user.bookings
      bookings.each do |booking|
        if booking.enddate < Date.today
          log = current_user.logs.build(log_params(booking))
          log.save
          booking.destroy
        end
      end
    end

    def log_params(param)
      log = {}
      log[:hotel_id]=param.hotel_id
      log[:user_id]=param.user_id
      log[:room_id]=param.room_id
      log[:startdate]=param.startdate
      log[:enddate]=param.enddate
      return log
    end
end
