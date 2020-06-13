module Admin
  class EventsController < ApplicationController
    def new
      @event = Event.new
    end

    def create
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
