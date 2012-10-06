class AddJourToDispos < ActiveRecord::Migration
  def change
    add_column :dispos, :jour, :datetime
  end
end
