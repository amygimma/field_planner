class CreateCrops < ActiveRecord::Migration
  def change
    create_table :crops do |t|
      t.string :crop
      t.string :family
      t.text :notes
      t.integer :greenhouse_time
      t.integer :maturity_time
      t.integer :user_id

      t.timestamps
    end
  end
end
