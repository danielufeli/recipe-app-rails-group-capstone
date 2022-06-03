class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :foods, class_name: 'Food', foreign_key: 'user_id', inverse_of: :user, dependent: :destroy
  has_many :recipes, class_name: 'Recipe', foreign_key: 'user_id', inverse_of: :user, dependent: :destroy

  validates :name, presence: true
  
  def missing_food
    user_recipes = recipes.includes(:recipe_foods)

    missing_food = []

    user_recipes.each do |recipe|
      missing_food.push(*recipe.recipe_foods.where.not(food_id: foods.ids).includes(:food))
    end

    price = calculate_missing_price(missing_food)

    { data: missing_food, price: }
  end

  def calculate_missing_price(missing_food)
    total_price = 0

    missing_food.each do |recipe_food|
      total_price += recipe_food.total_price
    end

    total_price
  end
end
