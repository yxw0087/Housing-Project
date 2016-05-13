class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    admin = Administrator.find_by(username: params[:session][:username])
    if admin && admin.authenticate(params[:session][:password])
      login admin
      flash.now[:success] = 'Logged in'
      redirect_to requests_path
    else
      flash.now[:danger] = 'Invalid username/password'
      render 'new'
    end
  end
  
  def destroy
    logout if logged_in?
    redirect_to adminlogin_url
  end
end
