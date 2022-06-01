class PublicRecipesController < ApplicationController
  def index
    @current_user = current_user

    @public_recipes = Recipe.includes(:user).includes(:recipe_foods).order(created_at: :desc)
  end
end
