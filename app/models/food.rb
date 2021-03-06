class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', inverse_of: :foods
  has_many :recipe_foods, class_name: 'RecipeFood', foreign_key: 'food_id', inverse_of: :food, dependent: :destroy
end
