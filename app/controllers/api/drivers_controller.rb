module Api
    class DriversController < ApplicationController

        def create
            @driver = Driver.create_or_find_by(driver_params)
            render json: @driver, status: :created
        end

        private

        def driver_params
            params.permit(:name, :messenger_id, :phone).with_defaults(trusted: false)
        end

    end
end