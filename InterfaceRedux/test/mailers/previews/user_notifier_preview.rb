# Preview all emails at http://localhost:3000/rails/mailers/user_notifier
class UserNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_notifier/account_activation
  def account_activation
    request = Request.first
    request.activation_token = Request.new_token
    UserNotifier.account_activation(request)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_notifier/request_denied
  def request_denied
    UserNotifier.request_denied
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_notifier/request_approved
  def request_approved
    UserNotifier.request_approved
  end

end
