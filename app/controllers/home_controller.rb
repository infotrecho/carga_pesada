class HomeController < ApplicationController
  def index
    @pagy, @events = pagy(Event.all)
    @stats = Statistics.new.process
  end
end
