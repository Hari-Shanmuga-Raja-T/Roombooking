class LogsController<ApplicationController
    def create
        new_log = Log.new
        new_log.hotel_id = params[:hotel_id]
        new_log.user_id = params[:user_id]
        new_log.room_id = params[:room_id]
        new_log.startdate = params[:startdate].to_s
        new_log.enddate = params[:enddate].to_s
        new_log.save
        room = Room.find_by(roomid: params[:room_id])
        room.update(status: 'Not available')
        room.save
        redirect_to '/users/userhome'
    end
end
