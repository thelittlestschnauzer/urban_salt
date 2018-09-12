class RecipesController < ApplicationController

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipes_path(@recipe)
    else
      render :new
    end
  end

  def index
    @recipes = Recipe.order("created_at DESC")
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :image)
  end
end
