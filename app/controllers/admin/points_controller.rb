module Admin
  class PointsController < Admin::AdminController
    def index
      @events = Event.last(100).to_json(only: %i[geocode description])
      render json: @events
    end
  end
end
