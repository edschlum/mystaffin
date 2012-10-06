class RemoveJourFromDispos < ActiveRecord::Migration
  def up
    remove_column :dispos, :jour
  end

  def down
    add_column :dispos, :jour, :date
  end
end
