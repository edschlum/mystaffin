class AddCommentsToDispos < ActiveRecord::Migration
  def change
    add_column :dispos, :comments, :string
  end
end
