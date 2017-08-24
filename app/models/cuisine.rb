class Cuisine < ApplicationRecord
  has_many :review_cuisines
  has_many :reviews, through: :review_cuisines
  has_many :restaurants, through: :reviews

  validates :name, presence: true
end
