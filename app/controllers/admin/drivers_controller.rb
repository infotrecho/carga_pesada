module Admin
    class DriversController < ApplicationController

        def index
            @pagy, @drivers = pagy(Driver.all)
        end 

        def new
            @driver = Driver.new
        end

        def create
            @driver = Driver.new(driver_params)
            if @driver.save
                redirect_to admin_drivers_path, notice: "Motorista salvo com successo"
            else
                render :new
            end
        end

        private

        def driver_params
            params.require(:driver).permit(:name, :phone).with_defaults(trusted: true)
        end 

    end
end