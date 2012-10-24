task :send_digest_mail => :environment do
  if Time.now.monday? 
    @user = User.all
    @user.each do |user| 
      puts "On est dans la boucle"
      mail =  Devise::Mailer.digest_email(user)
      mail.deliver
      puts "fin de la boucle"
    end 
  end
end