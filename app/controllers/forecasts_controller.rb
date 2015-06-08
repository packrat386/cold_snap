class ForecastsController < ApplicationController
  def display
    @f = Forecast.get_most_recent(current_zip)
    @wdata = @f.weather_days
    render 'display'
  end

  def show
  end

  private

  def current_zip
    zip = 60604
    if !current_user.nil? && !current_user.zipcode.nil?
      zip = current_user.zipcode
    end
    zip
  end
end
