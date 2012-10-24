task :send_digest_mail => :environment do
  #if Time.now.friday? # previous answer: Date.today.wday == 5
    User.all.each do |user| 
      puts "On est dans la boucle"
      Devise::Mailer.digest_email(user)
      puts "fin de la boucle"
    end 
  #end
end