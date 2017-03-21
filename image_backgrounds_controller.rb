class ImageBackgroundsController < InheritedResources::Base
	respond_to :html, :xml, :json
    load_and_authorize_resource

		def index
			@image_background = ImageBackground.all
		end


		def new
			super do|format|
				format.html { render partial: 'form' }
			end
		end

		def edit
			super do|format|
				format.html { render  partial: 'form' }
			end
		end

		def create
			super do |format|
				format.html { redirect_to :back }
			end
		end

		def update
			super do |format|
				format.html { redirect_to :back }
			end
		end

		def destroy
      resource.delete
      render status: 200, json: {}
    end

  	private
	  	def image_background_params
				params.require(:image_background).permit(:sede, :image, :image_mobile)
		end

end
