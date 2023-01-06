class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def show
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = "Recipe was successfully Added, recipe_id=#{@recipe.id}"
      redirect_to new_ingredient_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @recipe.update(recipe_params)
      flash[:notice] = "Recipe was edited successfully."
      redirect_to @recipe
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
      @recipe.destroy
      flash[:notice] = "The recipe was deleted."
      redirect_to recipes_path
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name)
  end
end
