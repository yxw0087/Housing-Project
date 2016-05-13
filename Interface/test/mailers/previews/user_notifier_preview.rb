# Preview all emails at http://localhost:3000/rails/mailers/user_notifier
class UserNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_notifier/response_email
  def response_email
    UserNotifier.response_email
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_notifier/denial_email
  def denial_email
    UserNotifier.denial_email
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_notifier/accept_email
  def accept_email
    UserNotifier.accept_email
  end

end
