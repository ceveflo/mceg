require 'rss'
require 'open-uri'
require 'nokogiri'
class Sourceinfo 

def getInfoXml(tipo)
			fecha =  (Time.now - 3.days).strftime("%Y-%m-%d")
  		case tipo
  		when 'G'
  			rss = Nokogiri.XML(open("http://www.elgrafico.com/Multimedia/XMLFeedGallery?date="+fecha).read)
  		when 'A'
  			rss = Nokogiri.XML(open("http://www.elgrafico.com/Multimedia/XMLFeedMMedia?date="+fecha).read)				
  		end
  		
  	end

end
