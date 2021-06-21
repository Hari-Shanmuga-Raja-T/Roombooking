class LogsController<ApplicationController
    

    def create
        new_log = Log.new
        new_log.hotel_id = params[:hotel_id]
        new_log.user_id = params[:user_id]
        new_log.room_id = params[:room_id]
        new_log.startdate = params[:startdate].to_s
        new_log.enddate = params[:enddate].to_s
        if valid_date_or_not(params[:startdate],params[:enddate])
            respond_to do |format|
                if new_log.save
                    room = Room.find_by(roomid: params[:room_id])
                    room.update(status: 'Not available')
                    room.save
                    format.html { redirect_to users_userhome_path , notice: "Successfully booked"}
                end
            end
        else
            respond_to do |format|
                format.html { redirect_to users_userroombooking_path(Hotel.find_by(id: params[:hotel_id])) , notice: "Invalid start and enddate"}
            end
        end
    end

    def valid_date_or_not(startdate , enddate)
        if Date.parse(startdate) < Date.today
           return false
        end
        if Date.parse(startdate) > Date.parse(enddate)
           return false
        end
        return true
     end

end
