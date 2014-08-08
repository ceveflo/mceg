class Archive < ActiveRecord::Base
	belongs_to :category
	belongs_to :channel
	has_many :media_files
	self.table_name =  "archive"

	def self.getType(slug , category = nil)
		case slug
		when 'Videos'
			tipo = 'V'
		when 'Galerias'
			tipo = 'G'
		when 'Audios'
			tipo = 'A'			
		end

		if !category.blank?
			if tipo == 'V'
					a = self.where("media_tag like ? " , "%"+category+"%")
				else
					category = Category.find_by tag: category
					a = self.where("category_id = ?" , category.id)
			end
			else
				a = self	
		end
		 a = a.where("media_type = ?" , tipo).order("date_publication DESC").limit(100)		
 		
	end
end