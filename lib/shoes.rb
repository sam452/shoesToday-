require_relative 'shoes'
require_relative 'request'

class Shoes
  include Enumerable
  attr_reader :last_shoes
  attr_reader :shoes
  attr_reader :shoes_image_url
  
  THRESHOLD = 30
  SHOES = [
    {:temp => 90, :precipitation => false, :shoes => 'Sandals'},
    {:temp => 90, :precipitation => true, :shoes => 'Flip-Flops'},
    {:temp => 80, :precipitation => false, :shoes => 'Sandals'},
    {:temp => 80, :precipitation => true, :shoes => 'Flats'},
    {:temp => 70, :precipitation => false, :shoes => 'Open-toed'},
    {:temp => 70, :precipitation => true, :shoes => 'Tall'},
    {:temp => 60, :precipitation => false, :shoes => 'Patent leather'},
    {:temp => 60, :precipitation => true, :shoes => 'Tall'},
    {:temp => 50, :precipitation => false, :shoes => 'Sneaker'},
    {:temp => 50, :precipitation => true, :shoes => 'Boots'},
    {:temp => 40, :precipitation => false, :shoes => 'Flats'},
    {:temp => 40, :precipitation => true, :shoes => 'Cowboy boots'},
    {:temp => 30, :precipitation => false, :shoes => 'Boots'},
    {:temp => 30, :precipitation => true, :shoes => 'Galoshes'},
    {:temp => 20, :precipitation => false, :shoes => 'Boots'},
    {:temp => 20, :precipitation => true, :shoes => 'Water-proof boots'},
    {:temp => 10, :precipitation => false, :shoes => 'Boots'},
    {:temp => 10, :precipitation => true, :shoes => 'Water-proof boots'},
  ]

  def initialize *args
    @shoes_image_url = ""
    #req = Request.new
    #my_array = [@temp, @precipitation]
    #req.my_weather "37215"
  end
  
  def last_shoes= (shoes)
    raise ArgumentError if shoes == self
      @last_shoes = shoes
  end
  
  
  def find_shoes(temp, precipitation)
    right_answers = SHOES.select do |combo|
      combo[:temp] == temp && combo[:precipitation] == precipitation
    end

    right_answers.first[:shoes]
  end
  
  def run(zip_code)
    Zip.new(zip_code)
    r = Request.new
    b = r.temperature_and_precipitation(@zip_code)
    b.norm_values
    s = Shoes.new
    s.find_shoes
  end


end

#Zip is provided by user
#Request is made using zip
#temp and precip values recd from request
#temp and precip values turned into norm values
#Shoes uses these values to return an image
