class RecipeTypesController < ApplicationController
    before_action :set_recipe_type, only: %i[show edit update destroy]

    def show
    end

    def index
      @recipe_types = RecipeType.all
    end

    def new
      @recipe_type = RecipeType.new
      @recipe = Recipe.find(params[:recipe_id])
    end

    def edit
    end

    def create
      @recipe_type = RecipeType.new(rt_params)
      if @recipe_type.save
        flash[:notice] = "Recipe type was successfully Added."
        redirect_to recipe_path(@recipe_type.recipe)
      else
        render 'new', status: :unprocessable_entity
      end
    end

    def update
      if @recipe_type.update(rt_params)
        flash[:notice] = "Recipe type edited successfully."
        redirect_to recipe_path(@recipe_type.recipe)
      else
        render 'edit', status: :unprocessable_entity
      end
    end

    def destroy
        @recipe_type.destroy
        flash[:notice] = "The recipe type was deleted."
        redirect_to recipes_path
    end

    private

    def set_recipe_type
      @recipe_type = RecipeType.find(params[:id])
    end

    def rt_params
      params.require(:recipe_type).permit(:recipe_type, :recipe_id)
    end
end
