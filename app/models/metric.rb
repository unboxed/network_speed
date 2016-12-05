class Metric < ActiveRecord::Base

  scope :last_hour, -> { where('created_at >= ?', 1.hour.ago).order('created_at ASC') }

end
