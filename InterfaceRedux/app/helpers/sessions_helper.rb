module SessionsHelper
  #Logs in administrators
  def login(administrator)
    session[:administrator_id] = administrator.id
  end
  #Returns the current administrator if one is already logged in. Otherwise returns nil
  def current_admin
    @current_admin ||= Administrator.find_by(id: session[:administrator_id])
  end
  #Returns if a user is logged in. Used for making sure only administrators that have
  #logged in can see the list of requests.
  def logged_in?
    !current_admin.nil?
  end
  def logout
    session.delete(:administrator_id)
    @current_admin = nil
  end
end
