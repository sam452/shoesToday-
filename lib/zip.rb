
class Zip

  attr_reader :zip_code

  def initialize( payload )
    @zip_code = payload
    validate
  end
  

  def validate
    raise 'Must be a 5-digit zip code' if /^[0-9]{5}$/.match(@zip_code) == nil
  end
  
  def save
    File.open('zip.txt', 'w+') do |f|
      f.puts @zip_code.to_s
    end
  end
  
  def saved?
    #f = File.open('zip.txt', 'r') do |f|
      #f.read.length > 0
      File.exist?('zip.txt')
  end

end