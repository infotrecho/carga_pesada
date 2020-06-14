class Statistics
  def process
    stats_by_classification = Event.unscoped.group(:classification).count.symbolize_keys
    OpenStruct.new(stats_by_classification)
  end
end
