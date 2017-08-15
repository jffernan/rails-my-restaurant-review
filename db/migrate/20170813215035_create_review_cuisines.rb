class CreateReviewCuisines < ActiveRecord::Migration[5.0]
  def change
    create_table :review_cuisines do |t|
      t.belongs_to :review, index: true, foreign_key: true
      t.belongs_to :cuisine, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
