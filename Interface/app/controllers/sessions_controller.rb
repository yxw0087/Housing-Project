class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    admin = Administrator.find_by(username: params[:session][:username].downcase)
    if admin && (admin.password == params[:session][:password])
      redirect_to requestqueue_url
      #Log in
    else
      flash.now[:danger] = 'Invalid password/username combination'
      render 'new'
    end
  end
  
  def destroy
    
  end
end
