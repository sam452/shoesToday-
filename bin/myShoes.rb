require '../lib/zip'
require 'net/http'
require 'rexml/document'
require 'json'
require '../lib/shoes'
require '../lib/request'


Shoes.app :width => 800, :height => 600 do
  background "#555"

  @title = "Shoes Today?"
  
  stack :margin => 10 do
    title strong(@title), :align => "center", :stroke => "#DFA", :margin => 0
    para "(Put in your U.S. zip code)", :align => "center", :stroke => "#DFA",
      :margin => 0
  end
end