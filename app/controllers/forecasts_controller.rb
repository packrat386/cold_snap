class ForecastsController < ApplicationController
  def display
    @f = Forecast.get_most_recent
    @wdata = @f.weather_days
    render 'display'
  end

  def show
  end
end
