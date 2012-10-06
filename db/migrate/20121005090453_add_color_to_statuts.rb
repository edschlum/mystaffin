class AddColorToStatuts < ActiveRecord::Migration
  def change
    add_column :statuts, :color, :string
  end
end
