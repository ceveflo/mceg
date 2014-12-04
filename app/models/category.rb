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

	def self.searchCat(categoria,tipo)
		strsearch = categoria.gsub("MC", "").strip()
		cat = self.where("tag = ? and seccion = '?' " , strsearch , tipo)
		cat = cat[0]
		if cat
		 	cat.id
		 else
		 	0
		 end 
	end
end
