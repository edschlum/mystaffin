class DigestMailer < ActionMailer::Base  
  default :to => User.all.map(&:email),
          :from => "noreplymystaffin@gmail.com"
 
  def digest_email(user)
    @user = User.all.map(&:email),
    @url = "http://www.mystaff.in"
    @recipients = "#{@user.name} <#{@user.email}>"
    @subject = "Pense à remplir ton TimeSheet !"
    @sent_on = Time.now
  
  end 
end
