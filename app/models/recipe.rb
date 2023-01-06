class Recipe < ApplicationRecord
 has_many :ingredients
 has_one :recipe_type
 validates :name, presence: true, uniqueness: true, length: {minimum: 5}
end
