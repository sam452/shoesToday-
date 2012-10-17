require 'test/unit'
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
    
  end
  
  def test_s05_precip_below_threshold_yields_false
    
  end
  
  def test_s20_
    
  end
  

end