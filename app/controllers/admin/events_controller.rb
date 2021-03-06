module Admin
  class EventsController < Admin::AdminController
    def index
      @pagy, @events = pagy(Event.all)
    end

    def new
      @event = Event.new
    end

    def create
      @event = Event.new(event_params)
      if @event.save
        redirect_to admin_events_path, notice: "Evento salvo com successo"
      else
        render :new
      end
    end

    private

    def event_params
      params.require(:event).permit(:description, :classification, :metadata, :priority, :latitude, :longitude)
    end
  end
end
