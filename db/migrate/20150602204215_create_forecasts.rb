class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.string :time_accessed
      t.integer :curr_precip_chance
      t.integer :curr_temp

      t.timestamps null: false
    end
  end
end
