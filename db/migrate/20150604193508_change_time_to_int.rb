class ChangeTimeToInt < ActiveRecord::Migration
  def change
    remove_column :forecasts, :time_accessed
    add_column :forecasts, :time_accessed, :integer
  end
end
