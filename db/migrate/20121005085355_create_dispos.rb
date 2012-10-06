class CreateDispos < ActiveRecord::Migration
  def change
    create_table :dispos do |t|
      t.date :date

      t.timestamps
    end
  end
end
