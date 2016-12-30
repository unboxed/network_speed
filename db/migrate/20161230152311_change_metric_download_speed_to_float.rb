class ChangeMetricDownloadSpeedToFloat < ActiveRecord::Migration
  def change
    change_column :metrics, :download_speed, :float
  end
end
