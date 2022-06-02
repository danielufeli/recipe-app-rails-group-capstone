class PublicRecipesController < ApplicationController
  def index
    @current_user = current_user
    public_recipes = Recipe.includes(:user).includes(:recipe_foods)
    @public_recipes = public_recipes.where("user_id != #{@current_user.id} and public = true").order(created_at: :desc)
  end
end
