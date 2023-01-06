class AddRecipeToIngredient < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :recipe_id, :int
  end
end
