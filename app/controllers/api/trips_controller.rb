module Api
  class TripsController < ApplicationController

    def create
      @driver = Driver.create_or_find_by(messenger_id: params[:messenger_id])
      @trip = Trip.new(trip_params.merge(driver: @driver))
      @trip.save
      render json: @trip, status: :created
    end

    private

    def trip_params
      params.permit(:origin, :destination, origin_geocode: [], destination_geocode: [])
    end

  end
end
