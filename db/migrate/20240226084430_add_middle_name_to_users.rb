class AddMiddleNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :middle_name, :string, default: ''
  end
end
