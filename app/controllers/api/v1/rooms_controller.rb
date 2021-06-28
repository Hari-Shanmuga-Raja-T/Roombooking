module Api
    module V1
      class RoomsController < ApplicationController
        before_action :doorkeeper_authorize! unless Rails.env.test?
        respond_to :json
        protect_from_forgery with: :null_session
        def create
            @room = Room.new(user_params)
            @room.save
        end

        def index
            respond_with Room.all
            # respond_with 'views/users/msg01'
            #render json: {user:@user , message: "Successfully updated"} , status:200
        end

        def update
            @room = Room.find_by(id: params[:id])
            @room.update(status: params[:status])
            # render html: 'views/users/msg01'
        end

        def destroy
            respond_with "Successfully deleted"
            Room.find(params[:id]).destroy
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