class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :content #text box in form view
      t.string :cuisine
      t.string :rating

      t.references :user, foreign_key: true #instead of t.integer :user_id
      t.references :restaurant, foreign_key: true
      t.timestamps
    end
  end
end
