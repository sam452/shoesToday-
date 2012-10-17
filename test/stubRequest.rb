require_relative 'request'

  class StubRequest << Request
  	
  	def temperature_and_precipitation
      {:temperature=>66, :precipitation=>30} 
  	end
  	
  	
  end
  
  
    def temperature_and_precipitation(zip)
  end
