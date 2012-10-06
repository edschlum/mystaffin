class AddUserToDispos < ActiveRecord::Migration
  def change
    add_column :dispos, :user_id, :int
  end
end
