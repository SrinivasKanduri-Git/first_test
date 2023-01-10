class AddRecipeIdToType < ActiveRecord::Migration[7.0]
  def change
    add_column :recipe_types, :recipe_id, :int
  end
end
