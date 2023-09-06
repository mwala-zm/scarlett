class AddPostgisExtensionToDatabase < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'postgis'
    create_table :my_spatial_table do |t|
      t.column :shape1, :geometry
      t.geometry :shape2
      t.line_string :path, srid: 3785
      t.st_point :lonlat, geographic: true
      t.st_point :lonlatheight, geographic: true, has_z: true
    end
  end
end
