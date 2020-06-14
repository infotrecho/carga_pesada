class Event < ApplicationRecord
  CLASSIFICATIONS = %w[accident hazard road_construction safety].freeze

  default_scope { order(created_at: :desc) }

  scope :near, ->(latitude, longitude, distance_in_km = 50) {
    where("ST_Distance(geocode_point, 'POINT(? ?)') < ?", longitude, latitude, distance_in_km * 1_000)
  }

  has_many :notifications

  validates :description, presence: true
  # validates :geocode, length: { is: 2, message: "Geocode should be in format [LATITUDE, LONGITUDE]" }, allow_blank: false
  validates :classification, inclusion: { in: CLASSIFICATIONS }
  validates :priority, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def latitude
    geocode_point&.latitude
  end

  def longitude
    geocode_point&.longitude
  end

  def latitude=(latitude)
    self.geocode_point = point(geocode_point.longitude, latitude)
  end

  def longitude=(longitude)
    self.geocode_point = point(longitude, geocode_point.latitude)
  end

  def geocode_point
    return super if attributes["geocode_point"].present?

    self.geocode_point = point(0, 0)
    geocode_point
  end

  private

  def point(latitude, longitude)
    "POINT(#{latitude} #{longitude})"
  end
end
