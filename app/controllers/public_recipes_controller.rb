class PublicRecipesController < ApplicationController
  def index
    @current_user = current_user
    @public_recipes = Recipe.all.where(public: true).order(created_at: :desc).includes(:recipe_foods)
  end
end
