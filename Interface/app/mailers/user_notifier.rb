class UserNotifier < ActionMailer::Base
  default from: "brandinui@gmail.com" #Administrator's email

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.notification_email.subject
  #
  def response_email(request)
    @clid = request.clid + "@louisiana.edu"
    @request = request
    mail  to: @clid, subject: 'Room Change Request Notice'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.denial_email.subject
  #
  # clid - A string that will come from the database when the admin
  #  presses a button
  def denial_email(clid)
    @clid = clid + "@louisiana.edu"

    mail to: clid, subject: 'Room Change Denied'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.accept_email.subject
  #
  # clid - A string that will come from the database when the admin
  #  presses a button
  def accept_email(clid)
    @clid = clid + "@louisiana.edu"

    mail to: clid , subject: 'Room Change Accepted'
  end
end