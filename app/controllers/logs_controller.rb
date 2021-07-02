class LogsController<ApplicationController
    def create
        log = Log.new
        $Rid = params[:room_id]
        log.hotel_id = Room.find_by(roomid: params[:room_id]).hotel_id
        log.user_id = params[:user_id]
        log.room_id = params[:room_id]
        log.startdate = params[:startdate].to_s
        log.enddate = params[:enddate].to_s
        respond_to do |format|
            if log.save
                format.html { redirect_to users_userhome_path , notice: "Successfully booked"}
            else
                format.html { redirect_to users_userhome_path , notice: log.errors.full_messages}
            end
        end
    end     
end
