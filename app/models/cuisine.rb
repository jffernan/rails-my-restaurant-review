class Cuisine < ApplicationRecord
  has_many :review_cuisines
  has_many :reviews, through: :review_cuisines

  validates :name, presence: true, uniqueness: true

end
