class Event < ApplicationRecord
  CLASSIFICATIONS = %w[accident hazard road_construction safety].freeze

  has_many :notifications

  validates :description, presence: true
  validates :geocode, length: { is: 2, message: "Geocode should be in format [LATITUDE, LONGITUDE]" }, allow_blank: false
  validates :classification, inclusion: { in: CLASSIFICATIONS }

  def latitude
    geocode&.first
  end

  def longitude
    geocode&.last
  end

  def geocode=(values)
    super(values.reject(&:blank?))
  end
end
