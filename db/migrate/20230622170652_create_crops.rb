class CreateCrops < ActiveRecord::Migration[7.0]
  def change
    create_table :crops do |t|
      t.string :name
      t.string :growth_stage
      t.text :description
      t.string :crop_family

      t.timestamps
    end
  end
end
