class RemoveDateFromDispos < ActiveRecord::Migration
  def up
    remove_column :dispos, :date
  end

  def down
    add_column :dispos, :date, :date
  end
end
