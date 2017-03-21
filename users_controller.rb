class UsersController < InheritedResources::Base
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

  def collection
    get_collection_ivar || set_collection_ivar(end_of_association_chain)
    if params[:email]
      @users = @users.where(email: params[:email])
    end
    @users.all
  end

  private
    def user_params
      params.require(:user).permit(:email,:support, :nombre, :role, :rss_link, :services, :logs, :estadisticas, :comunicacion_institucional, :popup_and_banner)
    end
end
