class AdminController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "17P2n2T7"
  before_action :set_category, only: [:updateArchive,:deleteMedia]
	layout 'admin'
  def index
  	
  end

  def loadtable
  		@archive = Archive.order("date_publication DESC").select("title , date_publication , media_type , num_views , id")
  		#tabla =  {'data'=>@archive}
  		#render json:tabla
  end

  def newMedia
  		@archive = Archive.new
  		@categories = Category.where('channel_id = 2')
  		@channels = Channel.all
  		
  end


  def editMedia
    @archive = Archive.find(params[:id_media])
    @mediafile = @archive.media_files
    @categories = Category.all
    @channels = Channel.all


  end


  def updateArchive
     respond_to do |format|
      if @archive.update(archive_params)
        format.html { redirect_to adminhome_path, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @archive }
      else
        format.html { render :edit }
        format.json { render json: @archive.errors, status: :unprocessable_entity }
      end
    end
  end

  def deleteMedia
      @archive.destroy
      redirect_to adminhome_path
  end
  def saveArchive

  		@archive = Archive.new(archive_params)

    respond_to do |format|
      if @archive.save
        
        format.html { redirect_to adminhome_path, notice: 'ARchive was successfully created.' }
        format.json { render :show, status: :created, location: @archive }
      else
        @categories = Category.all
  		@channels = Channel.all
        format.html { render 'admin/newMedia' }
        format.json { render json: @archive.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @archive = Archive.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def archive_params
      params.require(:archive).permit(:youtubeField , :category_id , :url_file , :channel_id , :title , :imageCDN, :media_type , :date_publication , :media_tag )
    end

end
