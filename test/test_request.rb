require 'test/unit'
require 'request'


class RequestTest < Test::Unit::TestCase

  def test_r01_request_http_success_with_37080
    a = Request.new
    b = a.get_weather(37080)
    assert_equal("200", b.code)
  end

  def test_r02_request_http_success_with_90210
    a = Request.new
    b = a.get_weather(90210)
    assert_equal("200", b.code)
  end
  
  def test_r03_stubRequest_37080_yields_72
    a = Request.new
    f = File.open('./doc/test.txt', 'r')
    response = f.read
    parsing = JSON.parse(response)
    assert_equal(parsing["forecast"]["simpleforecast"]["forecastday"][0]["high"]["fahrenheit"].to_i, 72)
  end

  def test_r04_stubRequest_37080_yields_0
    a = Request.new
    f = File.open('./doc/test.txt', 'r')
    response = f.read
    parsing = JSON.parse(response)
    assert_equal(parsing["forecast"]["txt_forecast"]["forecastday"][0]["pop"].to_i, 0)
  end


end

