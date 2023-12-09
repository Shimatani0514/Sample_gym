class AddStreetNumberToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :street_number, :string
  end
end
