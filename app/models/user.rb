class User < ActiveRecord::Base
rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :first_name
  # attr_accessible :title, :body
  has_and_belongs_to_many :teams
  has_many :dispos
  has_many :statuts, :through => :dispos 
  
  
end
