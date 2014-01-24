class AddUserIdToBeds < ActiveRecord::Migration
  def change
    add_column :beds, :user_id, :integer
  end
end
