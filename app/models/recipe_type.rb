class RecipeType < ApplicationRecord
  belongs_to :recipe
  validates :recipe_type, presence: true
end
