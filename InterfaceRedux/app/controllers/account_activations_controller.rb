#Should be named RequestActivationsController
class AccountActivationsController < ApplicationController

  def edit
    req = Request.find_by(clid: params[:clid])
    if req && !req.activated?
      req.activate_request
      flash[:success] = "Request submitted!"
      redirect_to root_url
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
  
end