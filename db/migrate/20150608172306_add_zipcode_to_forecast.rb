class AddZipcodeToForecast < ActiveRecord::Migration
  def change
    add_column :forecasts, :zipcode, :string
  end
end
