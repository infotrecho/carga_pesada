class Trip < ApplicationRecord
  belongs_to :driver
  has_many :notifications
end
