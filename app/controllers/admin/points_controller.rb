module Admin
  class PointsController < Admin::AdminController
    def index
      @events = Event.last(100).to_json(only: %i[description], methods: %i[latitude longitude])
      render json: @events
    end
  end
end
