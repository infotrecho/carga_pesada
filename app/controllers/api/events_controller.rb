module Api
  class EventsController < ApplicationController
    def index
      render json: Event.near(params[:latitude].to_f, params[:longitude].to_f),
             except: [:geocode_point, :geocode], methods: [:latitude, :longitude]
    end
  end
end
