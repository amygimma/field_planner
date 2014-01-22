class CreateBeds < ActiveRecord::Migration
  def change
    create_table :beds do |t|
      t.date :frost_date
      t.date :greenhouse_start
      t.date :greenhouse_end
      t.date :harvest
      t.date :use_frost
      t.integer :total_days
      t.date :plant_date
      t.integer :crops_id

      t.timestamps
    end
  end
end

 t.date :beds, :frost_date,:greenhouse_start, :greenhouse_end, :harvest, :use_frost, :total_days
      t.date :plant_date
      t.integer :crops_id
