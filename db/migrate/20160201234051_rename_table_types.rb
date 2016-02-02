class RenameTableTypes < ActiveRecord::Migration
  def change
    rename_table :types, :cuisines
  end
end
