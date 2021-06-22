module Api
    module V1
      class UsersController < ApplicationController
        respond_to :json
        protect_from_forgery with: :null_session
        def index
            respond_with User.all
        end

        def show
            respond_with User.find_by(id: params[:id])
        end

        def destroy
            respond_with "Successfully deleted"
            User.find(params[:id]).destroy
        end
      end
    end
  end