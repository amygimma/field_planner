class AddCropsIdToBeds < ActiveRecord::Migration
  def change
    add_column :beds, :crop_id, :integer
  end
end
