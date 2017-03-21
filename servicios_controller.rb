class ServiciosController < InheritedResources::Base
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
        success.html {flash[:notice] = "Servicio Sucessfully Created !"; redirect_to :back}

           failure.html do
             flash[:notice] = "Please check the form ..."; render :action => "new"
          end
      end
    end

    def update
      super do |success,failure|
        success.html {flash[:notice] = "Servicio Sucessfully Updated !"; redirect_to :back}

           failure.html do
             flash[:notice] = "Please check the form ..."; render :action => "edit"
          end
      end
    end

    def destroy
      resource.delete
      render status: 200, json: {}
    end

    def search
      @servicios = collection.where(start_date: Date.strptime(params[:start_date], "%d/%m/%Y")...Date.strptime(params[:end_date], "%d/%m/%Y"))
      render :index
    end

    def collection
      get_collection_ivar || set_collection_ivar(end_of_association_chain)
      if params[:role]
        @servicios= @servicios.where(role: params[:role])
      end

      if params[:start_date]
        @servicios= @servicios.where(start_date: Date.strptime(params[:start_date], "%d/%m/%Y")...Date.strptime(params[:end_date], "%d/%m/%Y"))
      end
      @servicios.all
    end

    private
      def servicio_params
        params.require(:servicio).permit(:name,:title, :description, :icon, :source_link, :role, :start_date, :end_date, :input_data, :servicio_category_id)
    end
  end
