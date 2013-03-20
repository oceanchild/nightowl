class SessionsController < ApplicationController
  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to :controller=>"users", :action=>"index", :notice => "Logged in successfully"
    else
      flash.now[:alert] = "Invalid login/password combination"
      # render :action => 'new'
      redirect_to :controller => 'login', :action => 'index', :notice => "Invalid login password combination"
    end
  end
  
  def destroy
    reset_session
    redirect_to root_path, :notice => "You successfully logged out"
  end
end
