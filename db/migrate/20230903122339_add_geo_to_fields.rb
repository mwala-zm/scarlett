class AddGeoToFields < ActiveRecord::Migration[7.0]
  def change
    add_column :fields, :field_geometry, :geometry
  end
end
