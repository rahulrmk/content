class NoticiaLinksController < InheritedResources::Base
  respond_to :html, :xml, :json
  load_and_authorize_resource

  def index
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
    super do |format|
      format.html { redirect_to :back }
    end
  end

  private
    def noticia_link_params
      params.require(:noticia_link).permit(:perfil, :url)
  end
end
