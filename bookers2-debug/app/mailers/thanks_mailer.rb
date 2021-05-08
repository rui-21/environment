class ThanksMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.thanks_mailer.welcome_mail.subject
  #
  def welcome_mail(user)
    @user = user
    @greeting = "こんにちは"

    mail to: @user.email, subject: '登録完了しました。'
  end
end
