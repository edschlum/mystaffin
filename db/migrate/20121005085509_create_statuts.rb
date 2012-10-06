class CreateStatuts < ActiveRecord::Migration
  def change
    create_table :statuts do |t|
      t.text :name
      t.text :class

      t.timestamps
    end
  end
end
