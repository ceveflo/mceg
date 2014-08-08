class PageController < ApplicationController

  def section

      @categories = Category.getType(params[:tipo])
      @archive = Archive.getType(params[:tipo] , params[:category])
      
  end

  def home


    tipo = (params[:tipo].blank?)? 0 : params[:tipo]
    now = Date.today
    tree = (now - 3)
    case tipo
    when 0
      @archive = Archive.order("date_publication DESC").limit(100)
      @destacado = Archive.select("id").where("date_publication >= ? " , tree).order("num_views DESC").limit(10)  
    when 1

      @archive = Archive.where("date_publication >= ? " , tree).order("num_views DESC").limit(10)
      
    when 2
      @archive = Archive.where("date_publication >= ? and num_comment > 0 " , tree).order("num_comment DESC").limit(10)
      
    end
    
   # render text: tipo
  end

  def gale
     now = Date.today
    tree = (now - 3)
    @video = Archive.find_by slug_name:params[:slug]
    @related = Archive.where("media_tag like ? " , @video.media_tag).order("rand()").limit(7)
    @destacado = Archive.select("id").where("date_publication >= ? " , tree).order("num_views DESC").limit(10)
  end

  def audio
    now = Date.today
    tree = (now - 3)
    @video = Archive.find_by slug_name:params[:slug]
    @related = Archive.where("media_tag like ? " , @video.media_tag).order("rand()").limit(7)
    @destacado = Archive.select("id").where("date_publication >= ? " , tree).order("num_views DESC").limit(10)
  end

  def video

     now = Date.today
    tree = (now - 3)
    @video = Archive.find_by slug_name:params[:slug]
    @related = Archive.where("media_tag like ? " , @video.media_tag).order("rand()").limit(7)
     @destacado = Archive.select("id").where("date_publication >= ? " , tree).order("num_views DESC").limit(10)
  end

  def guiriguiri
  end
end