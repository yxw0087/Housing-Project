require 'test_helper'

class UserNotifierTest < ActionMailer::TestCase
  test "account_activation" do
    mail = UserNotifier.account_activation
    assert_equal "Room Request Confirmation", mail.subject
    email = request.clid + '@louisiana.edu'
    assert_equal [email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match request.clid,               mail.body.encoded
    assert_match request.activation_token,   mail.body.encoded
    assert_match CGI::escape(email), mail.body.encoded
  end

  test "request_denied" do
    mail = UserNotifier.request_denied
    assert_equal "Request Change Request Denied", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "request_approved" do
    mail = UserNotifier.request_approved
    assert_equal "Request Change Request Approved", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
