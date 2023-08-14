class AddLocationToFields < ActiveRecord::Migration[7.0]
  def change
    add_column :fields, :location, :string
  end
end
