class RssController < ApplicationController

	def section
			 @archive = Archive.getType(params[:tipo] ,nil, 25)

			respond_to do |format|
			   format.rss { render :layout => false }
			end
	end

	def itunes
			@archive = Archive.getType('Audios' ,'guiriguirialaire', 25)
			respond_to do |format|
			   format.xml { render :layout => false }
			end
	end
end
