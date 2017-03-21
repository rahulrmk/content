class AppConfigurationsController < InheritedResources::Base
  respond_to :html, :xml, :json
  load_and_authorize_resource
	def index
	@backgrounds = Background.all
	@noticia_links = NoticiaLink.all
	@image_backgrounds = ImageBackground.all

	end


  def edit
    super do|format|
      format.html { render  partial: 'form' }
    end
  end

  def update
    super do |format|
      format.html { redirect_to :back }
    end
  end

  private
    def app_configuration_params
      params.require(:app_configuration).permit(:logout_time)
  end
end

