class LogsController<ApplicationController
    def create
        log = Log.new
        $Rid = params[:room_id]
        hotelid = Room.find_by(roomid: params[:room_id]).hotel_id
        log.hotel_id = hotelid
        log.user_id = params[:user_id]
        log.room_id = params[:room_id]
        log.startdate = params[:startdate]
        log.enddate = params[:enddate]
        respond_to do |format|
            if log.save
                format.html { redirect_to users_userhome_path , notice: "Successfully booked"}
            else
                format.html { redirect_to users_userroombooking_path(Hotel.find_by(id: hotelid)) , notice: log.errors.full_messages}
            end
        end
    end     
end
