task :send_digest_mail => :environment do
  if Time.now.friday? # previous answer: Date.today.wday == 5
    User.all.each do |user| 
      DigestMailer.digest_email(user)
    end 
  end
end