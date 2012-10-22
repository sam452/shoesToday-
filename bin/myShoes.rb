require '../lib/zip'
require 'net/http'
require 'rexml/document'
require 'json'
require 'shoes'
require '../lib/shoes'
require '../lib/request'

class Encoding
  US_ASCII = 'US-ASCII'
end

class String
  def encoding_aware?
    false
  end
  
  def force_encoding(enc)
    self
  end  
end


Shoes.app :width => 320, :height => 500 do
  background "#555"

  @title = "Shoes Today?"
  
  stack :margin => 10 do
    title strong(@title), :align => "center", :stroke => "#DFA", :margin => 0
    para "(Put in your U.S. zip code)", :align => "center", :stroke => "#DFA",
      :margin => 0
    @zip = edit_line
    #flow { check; para "Click if you want me to remember your zip"}
    button "Get my shoes" do
      if "Must be a 5-digit zip code"
        subtitle "Must be a 5-digit zip code"
      end
     s = Shoes.new
      picture = s.run("#{@zip.text}")
      image picture, :margin => 8
    end
    
  end
end