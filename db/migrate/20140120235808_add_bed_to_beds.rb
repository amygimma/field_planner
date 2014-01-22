class AddBedToBeds < ActiveRecord::Migration
  def change
    add_column :beds, :bed, :string
    add_index :beds, :bed
  end
end
