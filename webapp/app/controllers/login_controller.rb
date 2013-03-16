class LoginController < ApplicationController
  # before_filter :authenticate
  def index
    if logged_in?
      redirect_to :controller => 'users', :action => 'index'
    end
    @user = User.new
  end
  
  def authenticate
  
  end
  
  def index_new
  
  end
  
  def index_old
    
  end
  
  def map
    
  end
  
end
