require_relative 'zip'
require 'net/http'
require 'rexml/document'
require 'json'
require_relative 'zip'

class Request
  include Enumerable
  attr_accessor :temperature
  attr_accessor :precipitation

  THRESHOLD = 30

  def initialize *args
    @temperature = 0
    @precipitation = false
  end
  
  def get_weather(zip_code)
	base_url = 'http://api.wunderground.com/api/099628bc89fc5165/forecast/q/'
    url = "#{base_url}&zip=#{URI.encode(zip_code.to_s)}.json"
    response = Net::HTTP.get_response(URI.parse(url))
  end
  
  def temperature_and_precipitation(zip)
    response = get_weather(zip)
    result = JSON.parse(response.body)
    if result.has_key? 'Error'
      raise "web service error"
    end
    
    @temperature = result["forecast"]["simpleforecast"]["forecastday"][0]["high"]["fahrenheit"].to_i
    @precipitation = result["forecast"]["txt_forecast"]["forecastday"][0]["pop"].to_i

    { :temperature => @temperature, :precipitation => @precipitation }
  end
    
  def norm_temp
    (@temperature > 100 ? 90 : (@temperature/10.floor)*10)
  end
  
  def norm_precip
    (@precipitation > THRESHOLD ? true : false)
  end

  
  def my_weather(zip)
#      temp_and_precip = temperature_and_precipitation(zip)
#      @precipitation = temp_and_precip[:precipitation] < 31
#      @temperature = temp_and_precip[:temperature]
#      temp_and_precip
  end
 

end

#result["forecast"]["simpleforecast"]["forecastday"][0]["high"]["fahrenheit"]
#result["forecast"]["txt_forecast"]["forecastday"][0]["pop"]
#http://api.wunderground.com/api/099628bc89fc5165/history_19921225/q/37080.json
#array s/n zero, s/b int
#response 200
#because I'm in same class && I made temperature ACCESSOR I can leave offbeat
#@ sign and use it as a method foo.temperature