class AddColumnsToMetrics < ActiveRecord::Migration
  def change
    add_column :metrics, :host_name, :string
    rename_column :metrics, :speed, :download_speed
  end
end
