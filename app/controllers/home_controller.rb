class HomeController < ApplicationController
  before_action :authenticate_user!, except: :index
  # include Devise::Controllers::ScopedViews
  
  def index
  end
  
  def gangpyung
  end
end
