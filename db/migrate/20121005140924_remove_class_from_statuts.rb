class RemoveClassFromStatuts < ActiveRecord::Migration
  def up
    remove_column :statuts, :class
  end

  def down
    add_column :statuts, :class, :text
  end
end
