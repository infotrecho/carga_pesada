module Admin
  class EventsController < ApplicationController
    def new
      @event = Event.new
    end

    def create
      Rails.logger.info "*" * 90
      Rails.logger.info event_params
      Rails.logger.info "*" * 90

      @event = Event.new(event_params)
      if @event.save
        redirect_to root_path, notice: "Evento salvo com successo"
      else
        render :new
      end
    end

    private

    def event_params
      params.require(:event).permit(:description, :classification, :metadata, geocode: [])
    end
  end
end
