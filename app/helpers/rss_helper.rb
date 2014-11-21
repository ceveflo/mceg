#require 'Mp3Info'
require 'uri'

module RssHelper

		def tagmedia(urlmedia , category)

			# Load a file
			
			# uri = URI.parse(urlmedia)

			# media = File.basename(uri.path)
			# case category
			# when 96
			# 	folder = 'guiriguiri'	
			# when 98
			# 	folder = 'guiriguirinightclub'
			# when 97
			# 	folder = 'genteprimera'
			# else
			# 	folder = 'otrosdeportes'	
			# end
			

			# files = Rails.root.join("public", "files/audios",folder,media)
			
			# #Mp3Info.open(files) do |mp3info|
			# #  puts mp3info
			# #end

			#  audio_length=Mp3Info.open(files).length
			
		end
end
