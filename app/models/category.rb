class Category < ActiveRecord::Base
	has_many :archive

	def self.getType(slug)
		case slug
		when 'Videos'
			tipo = 'V'
		when 'Galerias'
			tipo = 'G'
		when 'Audios'
			tipo = 'A'			
		end

		self.where("seccion = ?" , tipo).order("name ASC")
 		
	end
end
