class Archive < ActiveRecord::Base
	belongs_to :category
	belongs_to :channel
	has_many :media_files
	self.table_name =  "archive"
	mount_uploader :imageCDN, FimageUploader
	after_update :save_media

	before_create :create_slug 
	after_create :create_youtube

	attr_accessor :url_file , :youtubeField , :url_type



	def self.getType(slug , category = nil , nlimit = 100 , page = 0)

		page = page.to_i * nlimit

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
		 a = a.where("media_type = ?" , tipo).order("date_publication DESC").limit(nlimit).offset(page)		
 		
	end

	private

	def save_media
		unless self.url_file.blank?
			media = MediaFile.find_by archive_id:self.id
			media.update_attribute('url_file' , self.url_file)
		end
		unless self.url_type.blank?
			media = MediaFile.find_by archive_id:self.id
			media.update_attribute('url_type' , self.url_type)
		end
	end

	def create_youtube
		if self.youtubeField
			media = MediaFile.new
			media.url_file = parse_youtube self.url_file
			media.url_type = 'Y'
			media.description = ' '
			media.archive_id = self.id
			media.save
		end
	end
	def parse_youtube url
	   regex = /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/
	   url.match(regex)[1]
	end

	def create_slug
		if self.slug_name.blank?
			self.slug_name = self.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
		end
	end
end
