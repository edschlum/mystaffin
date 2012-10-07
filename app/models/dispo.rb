class Dispo < ActiveRecord::Base
  attr_accessible :jour, :statut_id, :user_id, :comments
  belongs_to :user
  belongs_to :statut
  
  scope :of_day, lambda { |day| where(:jour => day.beginning_of_day..day.end_of_day) }
  scope :of_month, lambda { |month| where(:jour => month.beginning_of_month..month.end_of_month) }
  
  validates_presence_of :statut_id, :message => "Merci de saisir une dispo !"
  
end
