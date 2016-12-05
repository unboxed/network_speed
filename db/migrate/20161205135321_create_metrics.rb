class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.string :network_name
      t.integer :speed

      t.timestamps null: false
    end
  end
end
