require 'open-uri'

class Forecast < ActiveRecord::Base
  has_many :weather_days

  def self.get_most_recent(zipcode)
    @f = Forecast.find_by time_accessed: Forecast.where(zipcode: zipcode).maximum(:time_accessed)
    if @f.nil? || @f.too_old? || @f.zipcode != zipcode
      pull(zipcode)
    else
      @f
    end
  end

  def too_old?
    # let's make it check if it's more than an hour old
    (Time.now.to_i - time_accessed) > (3600)
  end

  private
  
  def self.pull(zipcode)
    doc = xml_doc(zipcode)
    wdays = parse_days(doc)
    @f = Forecast.create(time_accessed: Time.now().to_i,
                         curr_precip_chance: wdays[0][:precip_chance],
                         curr_temp: temp_now(doc),
                         zipcode: zipcode)
    wdays.each do |day|
      @f.weather_days.create(day)
    end
    @f
  end

  def self.temp_now(doc)
    currts = doc.xpath("//parameters//temperature[@type='hourly']//value")
    currts[0].content.to_i
  end
  
  def self.parse_days(doc)
    days = []
    parse_mint(doc, days)
    parse_maxt(doc, days)
    parse_precip(doc, days)
    days[0..3]
  end

  def self.parse_mint(doc, days)
    mints = doc.xpath("//parameters//temperature[@type='minimum']//value")
    mints.each_with_index do |val, i|
      days[i] ||= {}
      days[i][:low] = val.content
    end
  end

  def self.parse_maxt(doc, days)
    maxts = doc.xpath("//parameters//temperature[@type='maximum']//value")
    maxts.each_with_index do |val, i|
      days[i] ||= {}
      days[i][:high] = val.content
    end
  end

  def self.parse_precip(doc, days)
    precips = doc.xpath("//parameters//probability-of-precipitation//value")
    precip_arr = full_day_precip(precips)
    precip_arr.each_index do |i|
      days[i/2] ||= {}
      days[i/2][:precip_chance] ||= 0
      days[i/2][:precip_chance] += precip_arr[i] / 2
    end
  end

  def self.full_day_precip(precips)
    p_arr = []
    precips.each { |v| p_arr << v.content.to_i }
    if evening?
      p_arr.unshift(p_arr[0])
    else
      p_arr[1] = p_arr[0]
    end
    p_arr
  end

  def self.evening?
    Time.now.hour > 19 || Time.now.hour < 7
  end
    
  def self.xml_doc(zipcode)
    base_url = "http://graphical.weather.gov/xml/sample_products/browser_interface/ndfdXMLclient.php?"
    url_s = base_url + URI.encode_www_form(nws_params(zipcode)).to_s
    puts url_s
    Nokogiri::XML(open(url_s))
  end
  
  def self.nws_params(zipcode)
    params = {}
    # TODO: add user location
    params[:zipCodeList] = zipcode
    params[:product] = "time-series"
    params[:mint] = :mint
    params[:maxt] = :maxt
    params[:temp] = :temp
    params[:pop12] = :pop12
    params
  end
end
