class RecipeFoodsController < ApplicationController
  def edit
    @current_user = current_user
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update
    @current_user = current_user
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(quantity: params[:recipe_food][:quantity])
      flash[:notice] = "Recipe's food updated!"
      redirect_to recipe_path(@recipe_food.recipe.id)
    else
      flash[:alert] = "Recipe's food couldn't be updated, please try again."
      render action: :edit
    end
  end

  def destroy
    @current_user = current_user
    @recipe_food = RecipeFood.find(params[:recipe_food][:rf_id])
    @recipe_id = @recipe_food.recipe.id
    if @recipe_food.destroy
      flash[:notice] = "Recipe's food removed!"
    else
      flash[:alert] = "Recipe's food couldn't be removed, please try again."
    end
    redirect_to recipe_path(@recipe_id)
  end

  private

  def rf_params
    params.require(:recipe_food).permit(:quantity)
  end
end
