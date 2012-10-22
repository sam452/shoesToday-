require 'test/unit'
require 'request'

class ZipTest < Test::Unit::TestCase

  def test_z02_37080_complete
    zip = Zip.new("37080")
    assert_equal("37080", zip.zip_code)
  end
  
  def test_z03_12_yields_error
    assert_raise(RuntimeError) do
      Zip.new("12")
    end
  end

  def test_z04_zip_is_saved
    zip = Zip.new("37080")
    zip.save
    file = File.open("zip.txt", "r")
    output = file.read
    assert_equal('37080', output.chomp)
  end
  
  def test_z05_zip_saved?
    zip = Zip.new("90210")
    zip.save
    assert_equal(true, zip.saved?)
  end


end
