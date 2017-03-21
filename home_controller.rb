class HomeController < ApplicationController
  def index
    if current_user.super_user == true
      render 'index'
    end
  end

  def home

  end

  def show
    @user=User.all
  end
end
