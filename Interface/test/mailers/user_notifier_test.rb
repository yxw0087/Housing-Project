require 'test_helper'

class UserNotifierTest < ActionMailer::TestCase
  test "response_email" do
    mail = UserNotifier.response_email
    assert_equal "Response email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "denial_email" do
    mail = UserNotifier.denial_email
    assert_equal "Denial email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "accept_email" do
    mail = UserNotifier.accept_email
    assert_equal "Accept email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
