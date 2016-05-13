require 'net/smtp'
class UserNotifier < ApplicationMailer
default from: 'brandinui@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.account_activation.subject
  #
  def account_activation(request)
    @request = request
    @email = @request.clid + '@louisiana.edu'
    mail to: @email, subject: "Room Request Confirmation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.request_denied.subject
  #
  def request_denied(request)
    if !request.nil?
      @request = request
      @email = @request.clid + '@louisiana.edu'
      mail to: @email, subject: "Room Change Request Denied"
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.request_approved.subject
  #
  def request_approved(request)
    @request = request
    @email = @request.clid + '@louisiana.edu'
    mail to: @email, subject: "Room Change Request Approved"
  end
end
