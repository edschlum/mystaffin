class AddStatutToDispos < ActiveRecord::Migration
  def change
    add_column :dispos, :statut_id, :int
  end
end
