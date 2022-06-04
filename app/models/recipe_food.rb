class RecipeFood < ApplicationRecord
  belongs_to :recipe, class_name: 'Recipe', foreign_key: 'recipe_id', inverse_of: :recipe_foods
  belongs_to :food, class_name: 'Food', foreign_key: 'food_id', inverse_of: :recipe_foods

  def total_price
    food.price * quantity
  end
end
