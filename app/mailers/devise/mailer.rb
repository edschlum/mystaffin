class Devise::Mailer < ::ActionMailer::Base
  include Devise::Mailers::Helpers

  def confirmation_instructions(record)
    devise_mail(record, :confirmation_instructions)
  end

  def reset_password_instructions(record)
    devise_mail(record, :reset_password_instructions)
  end

  def unlock_instructions(record)
    devise_mail(record, :unlock_instructions)
  end
  
  def digest_email(user)
    headers["Reply-to"] = "noreplymystaffin@gmail.com"
    headers["Return-Path"] = "noreplymystaffin@gmail.com"
    @name = user.first_name
    mail(:from => "noreplymystaffin@gmail.com", :to => user.email, :subject => "Remplis ton TimeSheet !")
    sent_on = Time.now
  end
end