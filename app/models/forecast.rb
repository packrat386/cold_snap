require 'open-uri'

class Forecast < ActiveRecord::Base
  has_many :weather_days

  def get_most_recent
    pull
  end

  private

  def pull
    params = {}
    params[:lat] = 41.83
    params[:lon] = -87.68
    params[:product] = "time-series"
    params[:begin] = Time.new().utc.strftime("%FT%T%:z")
    week = Time.new() + (60*60*24*7)
    params[:end] = week.utc.strftime("%FT%T%:z")
    params[:wx]=:wx
    base_url = "http://graphical.weather.gov/xml/sample_products/browser_interface/ndfdXMLclient.php"
    url = URI.join(base_url, URI.encode_www_form(params))
    puts url.to_s
    doc = Nokogiri::XML(open(url.to_s))
    doc.inspect
  end
end
