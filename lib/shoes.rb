require_relative 'request'
require_relative 'zip'
#require 'ruby_debug'

class Shoes
  include Enumerable
  attr_reader :last_shoes
  attr_reader :shoes
  attr_reader :shoes_image_url
  
  SHOES = [
    {:temp => 90, :precipitation => false, :shoes => 'Sandals'},
    {:temp => 90, :precipitation => true, :shoes => 'FlipFlops'},
    {:temp => 80, :precipitation => false, :shoes => 'Sandals'},
    {:temp => 80, :precipitation => true, :shoes => 'Flats'},
    {:temp => 70, :precipitation => false, :shoes => 'Open-toed'},
    {:temp => 70, :precipitation => true, :shoes => 'Tall'},
    {:temp => 60, :precipitation => false, :shoes => 'PatentLeather'},
    {:temp => 60, :precipitation => true, :shoes => 'Tall'},
    {:temp => 50, :precipitation => false, :shoes => 'Sneaker'},
    {:temp => 50, :precipitation => true, :shoes => 'Boots'},
    {:temp => 40, :precipitation => false, :shoes => 'Flats'},
    {:temp => 40, :precipitation => true, :shoes => 'CowboyBoots'},
    {:temp => 30, :precipitation => false, :shoes => 'Boots'},
    {:temp => 30, :precipitation => true, :shoes => 'Galoshes'},
    {:temp => 20, :precipitation => false, :shoes => 'Boots'},
    {:temp => 20, :precipitation => true, :shoes => 'WaterProofBoots'},
    {:temp => 10, :precipitation => false, :shoes => 'Boots'},
    {:temp => 10, :precipitation => true, :shoes => 'Water-proofBoots'},
  ]
  
  IMAGES = {:Sandals => "../pub/sandals.jpg",
    :Flats => "../pub/flats.jpg",
    :PatentLeather => "../pub/patent-leather.jpg",
    :WaterProofBoots => "../pub/water-proof-boots.jpg",
    :Sneaker => "../pub/sneak.jpg",
    :OpenToed => "../pub/open-toed.jpg",
    :Tall => "../pub/tall.jpg",
    :FlipFlops => "../pub/flips.jpg",
    :CowboyBoots => "../pub/cowboy-boots.jpg",
    :Galoshes => "../pub/galoshes.jpg",
    :Boots => "../pub/boots.jpg"
  }

  def initialize *args
    @shoes_image_url = ""
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
    zip = Zip.new(zip_code)
    request = Request.new
    raw_values = request.temperature_and_precipitation(zip.zip_code)
    shoes = find_shoes(request.norm_temp, request.norm_precip)
    zip.save
    @shoes_image_url = IMAGES[shoes.to_sym]
  end
#50010, "99503", "33132"

end

#Zip is provided by user
#Request is made using zip
#temp and precip values recd from request
#temp and precip values turned into norm values
#Shoes uses these values to return an image
