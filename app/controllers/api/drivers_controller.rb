module Api
  class DriversController < ApplicationController

    def create
      @driver = Driver.create_or_find_by(params[:messenger_id]) do |driver|
          driver.assign_attributes(driver_params)
      end
      render json: @driver, status: :created
    end

    private

    def driver_params
      params.permit(:name, :messenger_id, :phone).with_defaults(trusted: false)
    end

  end
end