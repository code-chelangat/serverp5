class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :address
      t.integer :user_id
      t.string :region
      t.boolean :saved
      t.timestamps
    end
  end
end
