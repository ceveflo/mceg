require 'uri'

module PageHelper

	def blank_image(item)
		
	  if !item.imageCDN.blank?
	  	item.imageCDN
	  else
	  	if !item.image.blank?
	  		item.image
	  	else
	  		"default-audio.jpg"	
	  	end	
	  end	

	end


	def envivoPlayer(player)
			case player
			when 'transmision1'
				'<iframe width="560" height="340" src="http://cdn.livestream.com/embed/laprensagrafica?layout=4&color=0xe7e7e7&autoPlay=false&mute=false&iconColorOver=0x888888&iconColor=0x777777&allowchat=false&height=340&width=560" style="border:0;outline:0" frameborder="0" scrolling="no"></iframe>'
			when 'transmision2'
				'<iframe width="560" height="340" src="http://cdn.livestream.com/embed/lpg1?layout=4&color=0xe7e7e7&autoPlay=false&mute=false&iconColorOver=0x888888&iconColor=0x777777&allowchat=false&height=340&width=560" style="border:0;outline:0" frameborder="0" scrolling="no"></iframe>'				
			when 'transmision3'
				'<iframe src="http://new.livestream.com/accounts/1262246/events/2106704/player?width=640&height=360&autoPlay=true&mute=false" width="640" height="360" frameborder="0" scrolling="no"> </iframe>'
			when 'eventosmultimedia'
				'<iframe src="http://new.livestream.com/accounts/1262246/events/2441444/player?width=640&height=360&autoPlay=true&mute=false" width="640" height="360" frameborder="0" scrolling="no"> </iframe>'
			when 'noticias'	
				'<iframe src="http://new.livestream.com/accounts/1262246/events/2425724/player?width=640&height=360&autoPlay=true&mute=false" width="640" height="360" frameborder="0" scrolling="no"> </iframe>'
			when 'noticias2'
				'<iframe src="http://new.livestream.com/accounts/1262246/events/2441404/player?width=640&height=360&autoPlay=true&mute=false" width="640" height="360" frameborder="0" scrolling="no"> </iframe>'
			when 'lpgmultimedia'
				'<iframe src="http://new.livestream.com/accounts/1262246/events/2106704/player?width=640&height=360&autoPlay=true&mute=false" width="640" height="360" frameborder="0" scrolling="no"> </iframe>'
			when 'williammelendez'
				'<iframe src="http://new.livestream.com/accounts/1262246/events/2424756/player?width=640&height=360&autoPlay=true&mute=false" width="640" height="360" frameborder="0" scrolling="no"> </iframe>'						
			when 'deportes'
				'<iframe src="http://new.livestream.com/accounts/1262246/events/2441397/player?width=640&height=360&autoPlay=true&mute=false" width="640" height="360" frameborder="0" scrolling="no"> </iframe>'	
			when 'futbol'
				'<iframe src="http://new.livestream.com/accounts/1262246/events/2424563/player?width=640&height=360&autoPlay=true&mute=false" width="640" height="360" frameborder="0" scrolling="no"> </iframe>'		
			end
	end
	def type_archive(item)
		case item
		when 'A'
			"audio"
		when "V"
			"video"
		when "G"
			 "gale"
		end


	end

	def getFilename(url)

		#uri = URI.parse(url)

		#File.basename(uri.path)
		url
	end


	def is_destacado(destacado , item)
		
			if !destacado.blank?
				result = destacado.find_all { |v| v.id == item }
				if !result.blank? 
				 	"<span>Destacado</span>"
				else
					""
				end 
			end
	end

	def get_tags(strtags)
		tags = strtags.split(/,/)
		str = ''
		tags.each do |p|
			 str += "<a href='/tag/#{p}'>#{p}</a> "
		end
		str
	end


	def getParentUrl(tipo)
				link_to "Todos los #{tipo}" , {controller: :page , action: :section  , tipo: tipo}
	end
end
