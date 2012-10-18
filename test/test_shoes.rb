require 'test/unit'
require 'mocha'
require 'shoes'
# require 'ruby-debug'
require 'pry'

class ShoeTest < Test::Unit::TestCase

  def test_s01_temp_70_precip_is_false_yields_open_toed_focus
    z = Zip.new("37080")
    r = Request.new
    response = r.get_weather(z.zip_code)
    s = Shoes.new
    assert_equal("Open-toed", s.find_shoes(70, false))
  end
  
  def test_s10_failure_returns_last_shoe
    Request.stubs(:get_weather).raises
  end
  
  def test_s05_precip_below_threshold_yields_false
    
  end
  
  def test_s20_37080
    z = Zip.new("37210")
    r = Request.new
    response = r.get_weather(z.zip_code)
    s = Shoes.new
    assert_equal("../pub/open-toed.jpg", s.run(z.zip_code))
  end
 
   def test_s21_50010
    z = Zip.new("50010")
    r = Request.new
    response = r.get_weather(z.zip_code)
    s = Shoes.new
    assert_equal("../pub/open-toed.jpg", s.run(z.zip_code))
  end
  
   def test_s21_99503
    z = Zip.new("99503")
    r = Request.new
    response = r.get_weather(z.zip_code)
    s = Shoes.new
    assert_equal("../pub/open-toed.jpg", s.run(z.zip_code))
  end
  


end