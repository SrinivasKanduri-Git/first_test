class Ingredient < ApplicationRecord
  belongs_to :recipe
  validates :list, presence: true
end
