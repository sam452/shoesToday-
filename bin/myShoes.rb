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


Shoes.app :width => 300, :height => 500 do
  background "#555"

  @title = "Shoes Today?"
  
  stack :margin => 10 do
    title strong(@title), :align => "center", :stroke => "#DFA", :margin => 0
    para "(Put in your U.S. zip code)", :align => "center", :stroke => "#DFA",
      :margin => 0
    @zip = edit_line
    #flow { check; para "Click if you want me to remember your zip"}
    button "Get my shoes" do
      para "editline zip =" + "#{@zip.text.length}"
      batman = @zip
      if @zip.text.length < 5
        batman = File.open('zip.txt', 'r').read
        para "file read: #{File.open('zip.txt', 'r').read}"
      end

      @zip = batman
      para "zip = #{@zip.text}"
       para "zip-bat = #{batman.text}"
     s = Shoes.new
      picture = s.run("#{@zip.text}")
      para picture
      image picture, :margin => 8
    end
    
    
    
  end
end


#  @frame.clear do
#   
#  end