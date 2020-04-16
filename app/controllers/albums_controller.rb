class AlbumsController < ApplicationController
	before_action :check_authentication, except: [:show, :index]
	
	def index
		@albums = Album.all
	end

	def new
		@album = Album.new
	end

	def create
		@album = Album.new(album_params.merge(user_id: current_user.id))
		if @album.save
			redirect_to album_path(@album)
		else
			render :new, :flash => @album.errors.full_messages.join(", ")
		end
	end

	def show
		@album = Album.find(params[:id])
	end

  def add_image
    respond_to do |format|               
      format.js
    end
  end

  def profile
  	@albums = current_user.albums
  end

	private
		def album_params
			params.require(:album).permit(:name, :user_id, images_attributes:[:id, :img, :tag_line])
		end

		def check_authentication
			unless current_user.present?
				redirect_to root_path
			end
		end
end
