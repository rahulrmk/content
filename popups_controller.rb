class PopupsController < InheritedResources::Base
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
      success.html {flash[:notice] = "Popup Sucessfully Created !"; redirect_to :back}

         failure.html do
           flash[:notice] = "Please check the form ..."; render :action => "new"
        end
    end
  end

  def update
    super do |success,failure|
      success.html {flash[:notice] = "Popup Sucessfully Updated !"; redirect_to :back}

         failure.html do
           flash[:notice] = "Plese check the form..."; render :action => "edit"
        end
    end
  end

  def destroy
    resource.delete
    render status: 200, json: {}
  end

  def collection
     get_collection_ivar || set_collection_ivar(end_of_association_chain)
     if params[:role]
       @popups = @popups.where(role: params[:role])
     end

       if params[:start_date]
       @popups= @popups.where(start_date: Date.strptime(params[:start_date], "%d/%m/%Y")...Date.strptime(params[:end_date], "%d/%m/%Y"))
     end
  @popups.all

   end

  private
    def popup_params
      params.require(:popup).permit(:name,:title, :image, :image_mobile, :source_link,:role, :start_date, :end_date)
    end
end



