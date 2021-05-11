class DailyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.daily_mailer.daily_mail.subject
  #
  def daily_mail
    default to: -> { User.pluck(:email) }
    mail(subject: "おはようございます!")
  end
end
