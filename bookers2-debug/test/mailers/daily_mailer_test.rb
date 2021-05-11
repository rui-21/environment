require 'test_helper'

class DailyMailerTest < ActionMailer::TestCase
  test "daily_mail" do
    mail = DailyMailer.daily_mail
    assert_equal "Daily mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
