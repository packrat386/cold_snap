class CreateWeatherDays < ActiveRecord::Migration
  def change
    create_table :weather_days do |t|
      t.integer :high
      t.integer :low
      t.integer :precip_chance
      t.references :forecast, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
