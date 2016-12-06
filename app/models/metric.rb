class Metric < ActiveRecord::Base

  scope :last_hour, -> { where('created_at >= ?', 1.hour.ago).order('created_at ASC') }
  scope :last_24_hours, -> { where('created_at >= ?', 24.hours.ago).order('created_at ASC') }

end
