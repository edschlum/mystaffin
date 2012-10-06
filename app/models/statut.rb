class Statut < ActiveRecord::Base
  attr_accessible :name, :color
  has_many :dispos
  has_many :users, :through => :dispos
  
  validates_presence_of :name, :message => "Merci de saisir une dispo !"
end
