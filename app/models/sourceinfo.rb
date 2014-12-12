require 'rss'
require 'open-uri'
require 'nokogiri'
require 'brightcove-api'

class Sourceinfo 

def getInfoXml(tipo)
			fecha =  (Time.now - 7.days).strftime("%Y-%m-%d")
  		case tipo
  		when 'G'
  			rss = Nokogiri.XML(open("http://www.elgrafico.com/Multimedia/XMLFeedGallery?date="+fecha).read)
  		when 'A'
  			rss = Nokogiri.XML(open("http://www.elgrafico.com/Multimedia/XMLFeedMMedia?date="+fecha).read)				
  		end
  		
  	end



def brightcoveinfo()

data = JSON.load(open("http://api.brightcove.com/services/library?command=search_videos&token=1lI7eegjganW_lTrfk4BwUPQMlWMVQGt2niK3dCFUk210VqYUVYgxg..&all=canal%3Ael%20grafico&page_size=30&sort_by=CREATION_DATE%3ADESC&video_fields=id%2Cname%2CshortDescription%2CcreationDate%2CvideoStillURL%2Ctags%2CplaysTotal%2CpublishedDate&get_item_count=true"))

	json = data['items']

end

def brightcoveinfobyid(bid)

data = JSON.load(open("http://api.brightcove.com/services/library?command=find_video_by_id&token=1lI7eegjganW_lTrfk4BwUPQMlWMVQGt2niK3dCFUk210VqYUVYgxg..&video_id=#{bid}&video_fields=videoStillURL"))

  json = data

end

end
