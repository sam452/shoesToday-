require 'test/unit'
require 'mocha'
require 'shoes'
# require 'ruby-debug'
require 'pry'

class ShoeTest < Test::Unit::TestCase

  def test_s01_temp_70_precip_is_false_yields_openToed
    zip = Zip.new("37080")
    request = Request.new
    response = request.get_weather(zip.zip_code)
    shoes = Shoes.new
    assert_equal("OpenToed", shoes.find_shoes(70, false))
  end
  
  def test_s20_37080_yields_opentoed_shoes
    zip = Zip.new("37080")
    request = Request.new
    file = File.open('./doc/test.txt', 'r')
    response = file.read
    parsing = JSON.parse(response)
    request.temperature = parsing["forecast"]["simpleforecast"]["forecastday"][0]["high"]["fahrenheit"].to_i
    request.precipitation = parsing["forecast"]["txt_forecast"]["forecastday"][0]["pop"].to_i
    request.norm_temp
    request.norm_precip
    shoes = Shoes.new
    my_shoes = shoes.find_shoes(request.norm_temp, request.norm_precip)
    assert_equal("../pub/open-toed.jpg", IMAGES[my_shoes.to_sym])
  end

end

