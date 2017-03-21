class RssLinksController < InheritedResources::Base
  respond_to :html, :xml, :json
  load_and_authorize_resource

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
    super do |success,failure|
      success.html {flash[:notice] = "Rss Link Sucessfully Created !"; redirect_to :back}

      failure.html do
        flash[:notice] = "Please check the form ..."; render :action => "new"
      end
    end
  end

  def update
    super do |success,failure|
      success.html {flash[:notice] = "Rss Link Sucessfully Created !"; redirect_to :back}

      failure.html do
        flash[:notice] = "Please check the form ..."; render :action => "new"
      end
    end
  end

  def destroy
    super do |format|
      format.html { redirect_to :back }
    end
  end

  def collection
    get_collection_ivar || set_collection_ivar(end_of_association_chain)
    if params[:role]
      @rss_links= @rss_links.where(role: params[:role])
    end
    @rss_links.all
  end

  private
    def rss_link_params
      params.require(:rss_link).permit(:name, :url, :rss_category_id, :enable, :role)
    end
end
