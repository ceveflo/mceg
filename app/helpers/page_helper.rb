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
