class ThanksMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.thanks_mailer.welcome_mail.subject
  #
  def welcome_mail
    @greeting = "Hi"

    mail to: "reisu0120@gmail.com"
  end
end
