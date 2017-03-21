class ServicioCategoriesController < InheritedResources::Base
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
      success.html {flash[:notice] = "Servicio Category Sucessfully Created !"; redirect_to :back}

         failure.html do
           flash[:notice] = "Please check the form ..."; render :action => "new"
        end
    end
  end

  def update
    super do |success,failure|
      success.html {flash[:notice] = "Servicio Category Sucessfully Created !"; redirect_to :back}

         failure.html do
           flash[:notice] = "Please check the form ..."; render :action => "edit"
        end
    end
  end

  def destroy
    super do |format|
      format.html { redirect_to :back }
    end
  end

  private
    def servicio_category_params
      params.require(:servicio_category).permit(:code, :nombre)
    end
end
