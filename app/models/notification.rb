class Notification < ApplicationRecord
  belongs_to :event
  belongs_to :trip
end
