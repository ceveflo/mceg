class AdminController < ApplicationController
	layout 'admin'
  def index
  	
  end

  def loadtable
  		@archive = Archive.order("date_publication DESC").select("title , date_publication , media_type , num_views")
  		tabla =  {'data'=>@archive}
  		render json:tabla
  end
end
