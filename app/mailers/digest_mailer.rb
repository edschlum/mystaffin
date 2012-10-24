class DigestMailer < ActionMailer::Base  
 
  def digest_email(user)
    @url = "http://www.mystaff.in"
    @recipients = "#{user.name} <#{user.email}>"
    @subject = "Remplis ton TimeSheet !"
    @sent_on = Time.now
  end 
end
