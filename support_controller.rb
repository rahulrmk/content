class SupportController < ApplicationController
  SWITCH_URL = 'http://10.1.180.58'

  authorize_resource :class => false

  def index
  end

  def switch_to_support
    redirect_to "#{SWITCH_URL}/switch_to_user?rut=#{params[:support][:rut]}&email=#{current_user.email}"
  end
end
