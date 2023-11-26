class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name  
      t.string :email
      t.date :birth_date 
      t.string :postal_code
      t.string :address
      t.boolean :terms_accepted

      t.timestamps
    end
  end
end
