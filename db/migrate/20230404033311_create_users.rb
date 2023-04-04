class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :string do |t|
      t.string :name
      t.string :age
      t.string :phone_number
      t.string :location

      t.timestamps
    end
  end
end
