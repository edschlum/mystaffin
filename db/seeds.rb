# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
puts 'CREATING ROLES'
Role.create([
  { :name => 'admin' }, 
  { :name => 'user' }, 
  { :name => 'manager' }
], :without_protection => true)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Admin Admin', :email => 'edouard.schlumberger@gmail.com', :password => 'edouard', :password_confirmation => 'edouard'
#puts 'SETTING UP DEFAULT USER LOGIN'
#user1 = User.create! :name => 'First User', :email => 'user4@example.com', :password => 'please', :password_confirmation => 'please'
#puts 'SETTING UP DEFAULT USER LOGIN'
#user2 = User.create! :name => 'Third User', :email => 'user5@example.com', :password => 'please', :password_confirmation => 'please'
user.add_role :admin
#user1.add_role :manager