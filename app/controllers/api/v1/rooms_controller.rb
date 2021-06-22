module Api
    module V1
      class RoomsController < ApplicationController
        respond_to :json
        protect_from_forgery with: :null_session
        def create
            @room = Room.new(user_params)
            if @room.save
                respond_with "Successfully creates"
            else
                respond_with "Creation was unsuccessful"
            end
        end
        def update
            @room = Room.find_by(id: params[:id])
            if @room.update(status: params[:status])
                respond_with "Successfully updated"
            else
                respond_with "Updation was unsuccessful"
            end
        end

        private

        def user_params
            room = {}
            room[:roomid] = params[:roomid]
            room[:hotel_id] = params[:hotel_id]
            room[:roomno] = params[:roomno]
            room[:status] = params[:status]
            room[:price] = params[:price]
            room[:roomtype] = params[:roomtype]
            return room
        end
      end
    end
end