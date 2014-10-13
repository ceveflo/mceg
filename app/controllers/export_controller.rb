class ExportController < ApplicationController
  def brigtcove

  end

  def gnweb
  		data = Sourceinfo.new
  		tipo = params[:tipo]
  		info = data.getInfoXml(tipo)
  		path = info.css("item")
  		data =  ""
  		
  		var = ""
  		title = ""
  		path.each do |p|
  			title = (p.css('headline').text).strip()
  			record = Archive.where("title = ? and media_type = ? " , title , tipo).first
			fecha = DateTime.parse(p.css("date").text).strftime("%Y-%m-%d %H:%M:%S")	  			


  			if record
  				#si record exite

  				categoria = Category.searchCat(p.css("category").text , tipo)
	 			hash = {'title'=>title ,
	 				
	 				'image'=>(p.css('thumbnail').text).strip(),  
	 				'imageCDN'=>(p.css('thumbnail').text).strip(),
	 				 'media_tag'=>(p.css('tags').text).strip() , 
	 				  'category_id'=>categoria,
	 				  'media_type'=>tipo
	 				}
	 			archive = record.update_attributes(hash)
	 				MediaFile.where(:archive_id => record.id).destroy_all

	 				pathimage = p.css('subitems child')
	 				pathimage.each do |image|
	 					imghash = {'url_file'=>image.css('image').text , 'url_type'=>'G' , 'description'=>image.css('caption').text , 'archive_id'=>record.id}
	 					mediafile = MediaFile.new(imghash)
	 					mediafile.save
	 				
	 			end
  			else 
	 			#si es nuevo record
	 			
	 			categoria = Category.searchCat(p.css("category").text , tipo)
	 			hash = {'title'=>title ,
	 				'date_publication'=>fecha , 
	 				'image'=>(p.css('thumbnail').text).strip(),  
	 				'imageCDN'=>(p.css('thumbnail').text).strip(),
	 				'num_views'=>0,
	 				'featured_archive'=>0,
	 				'disqus_id'=>0,
	 				'num_comment'=>0,
	 				'oldID'=>0,
	 				'oldFolder'=>" ",
	 				 'media_tag'=>(p.css('tags').text).strip() , 
	 				 'slug_name'=>(p.css('url').text).strip() ,
	 				  'channel_id'=>(tipo=='G')? 17 : 16,
	 				  'category_id'=>categoria,
	 				  'media_type'=>tipo
	 				}
	 			archive = Archive.new(hash)
	 			if archive.save	
	 				pathimage = p.css('subitems child')
	 				pathimage.each do |image|
	 					imghash = {'url_file'=>image.css('image').text , 'url_type'=>'G' , 'description'=>image.css('caption').text , 'archive_id'=>archive.id}
	 					mediafile = MediaFile.new(imghash)
	 					mediafile.save
	 				end
	 			end

  			end


  			
  		end

  		render :text=>title
  end

  def audio
  end
end
