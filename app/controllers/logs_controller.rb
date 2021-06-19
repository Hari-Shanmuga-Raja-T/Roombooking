class LogsController<ApplicationController
    def create
        new_log = Log.new
        new_log.hotel_id = params[:hotel_id]
        new_log.user_id = params[:user_id]
        new_log.room_id = params[:room_id]
        new_log.startdate = params[:startdate]
        new_log.enddate = params[:enddate]
        new_log.save
        redirect_to '/users/userhome'
    end
end
