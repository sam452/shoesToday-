require 'test/unit'
require 'request'

class ZipTest < Test::Unit::TestCase

  def test_z02_37080_complete
    z = Zip.new("37080")
    assert_equal("37080", z.zip_code)
  end
  
  def test_z03_12_yields_error
    assert_raise(RuntimeError) do
      Zip.new("12")
    end
  end

  def test_z04_zip_is_saved
    z = Zip.new("37080")
    z.save
    f = File.open("zip.txt", "r")
    e = f.read
    assert_equal('37080', e.chomp)
  end
  
  def test_z05_zip_exists
    z = Zip.new("90210")
    z.save
    assert_equal(true, z.saved?)
  end


end
