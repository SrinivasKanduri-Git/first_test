class IngredientsController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def show
  end

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def edit
  end

  def create
    @ingredient = Ingredient.new(ing_params)
    if @ingredient.save
      flash[:notice] = "ingredient was successfully Added."
      redirect_to recipe_path(@ingredient.recipe)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @ingredient.update(ing_params)
      flash[:notice] = "ingredient edited successfully."
      redirect_to recipe_path(@ingredient.recipe)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
      @ingredient.destroy
      flash[:notice] = "The recipe was deleted."
      redirect_to recipes_path
  end


  private

  def set_recipe
    @ingredient = Ingredient.find(params[:id])
  end

  def ing_params
    params.require(:ingredient).permit(:list, :recipe_id)
  end
end
