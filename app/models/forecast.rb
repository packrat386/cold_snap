require 'open-uri'

class Forecast < ActiveRecord::Base
  has_many :weather_days

  def get_most_recent
    pull
  end

  private

  def pull
    doc = xml_doc
    doc.xpath("//parameters//temperature[@type='minimum']//value").each do |val|
      puts val.content
    end
  end

  def xml_doc
    base_url = "http://graphical.weather.gov/xml/sample_products/browser_interface/ndfdXMLclient.php?"
    url_s = base_url + nws_now + nws_next_week + URI.encode_www_form(params).to_s
    puts url_s
    Nokogiri::XML(open(url_s))
  end
  
  def nws_now
    "&begin=#{Time.new().utc.strftime('%FT%T')}"
  end

  def nws_next_week
    week = Time.new() + (60*60*24*8)
    "&end=#{week.utc.strftime('%FT%T')}&"
  end

  def params
    params = {}
    # TODO: add user location
    params[:zipCodeList] = 60604
    params[:product] = "time-series"
    params[:mint] = :mint
    params[:maxt] = :maxt
    params[:temp] = :tempfor
    params[:pop12] = :pop12
    params
  end
end
