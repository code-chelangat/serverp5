class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :star_rating
      t.text :comment
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
