class RecipesController < ApplicationController
  def index
    @current_user = current_user
    @recipes = @current_user.recipes.order(created_at: :desc)
  end

  def show
    @current_user = current_user
    @recipe = Recipe.find(params[:id])
    @f_field = params[:field] || 'name'
    @f_order = params[:order] || 'asc'
    @rec_foods = RecipeFood.joins(:food).where(recipe_id: params[:id]).order("#{@f_field} #{@f_order}").includes(:food)
  end

  def new
    @current_user = current_user
  end

  def create
    @current_user = current_user
    @recipe = @current_user.recipes.new(recipe_params)
    if @recipe.save
      flash[:notice] = 'Recipe created successfully'
      redirect_to recipes_url
    else
      flash.now[:alert] = @recipe.errors.full_messages.to_sentence
      render :new, status: 422
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe][:recipe_id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
