class DigestMailer < ActionMailer::Base  
  default :from => "noreplymystaffin@gmail.com"
 
  def digest_email(user)
    @url = "http://www.mystaff.in"
    @recipients = "#{user.name} <#{user.email}>"
    @subject = "Remplis ton TimeSheet !"
    @sent_on = Time.now
  
  end 
end
