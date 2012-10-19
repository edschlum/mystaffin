# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user0 = User.create! :name => 'Third User', :email => 'user0@example.com', :password => 'please', :password_confirmation => 'please', :admin => 'true'
puts 'New user created: ' << user0.name