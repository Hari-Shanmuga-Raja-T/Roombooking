module Api
    module V1
      class LogsController < ApplicationController
        before_action :doorkeeper_authorize!
        respond_to :json
        protect_from_forgery with: :null_session
        def index
            respond_with Log.all
        end
      end
    end
  end