class RemoveCuisineFromReviews < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :cuisine, :string
  end
end
