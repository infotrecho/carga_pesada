module EventHelper
  BADGES = {
    "accident"            => "badge-danger",
    "hazard"              => "badge-warning",
    "road_construction"   => "badge-info",
    "safety"              => "badge-danger",
  }.freeze

  def event_badge(event)
    BADGES[event.classification]
  end
end
