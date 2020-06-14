class Trip < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :driver
  has_many :notifications

  validates :origin_geocode, length: { is: 2, message: "Origin Geocode must be in format [LATITUDE, LONGITUDE]" }, allow_blank: false
  validates :destination_geocode, length: { is: 2, message: "Destination Geocode must be in format [LATITUDE, LONGITUDE]" }, allow_blank: false

  def origin_latitude
    origin_geocode&.first
  end

  def origin_longitude
    origin_geocode&.last
  end

  def destination_latitude
    destination_geocode&.first
  end

  def destination_longitude
    destination_geocode&.last
  end

  def geocode=(values)
    super(values.reject(&:blank?))
  end
end
