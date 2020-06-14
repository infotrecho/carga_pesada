module Admin
  class TripsController < ApplicationController
    def index
      @pagy, @trips = pagy(Trip.all)
    end

    def new
      @trip = Trip.new
    end 

    def create
      @trip = Trip.new(trip_params)
      if @trip.save
        redirect_to root_path, notice: "Percurso salvo com successo"
      else
        render :new
      end
    end

    private 

    def trip_params
      params.require(:trip).permit()
    end
  end
end