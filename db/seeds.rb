# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

u1 = User.create(name: 'user1', email: 'user1@gmail.com', password: 'aaaaaa', confirmed_at: Time.now)
u2 = User.create(name: 'user2', email: 'user2@gmail.com', password: 'aaaaaa', confirmed_at: Time.now)

food1 = Food.create(name: 'food1', measurement_unit: 'kile', price: 2.5, user: u1)
food2 = Food.create(name: 'food2', measurement_unit: 'kile', price: 5.3, user: u1)
food3 = Food.create(name: 'food3', measurement_unit: 'kile', price: 3.0, user: u2)

rec1 = Recipe.create(name: 'recipe1', preparation_time: 1.5, cooking_time: 0.75, description: 'Recipe 1 steps', user: u1)
rec2 = Recipe.create(name: 'recipe2', preparation_time: 2, cooking_time: 1, description: 'Recipe 2 steps', user: u1)

rf1 = RecipeFood.create(quantity: 2, recipe: rec1, food: food1)
rf2 = RecipeFood.create(quantity: 1, recipe: rec1, food: food2)
rf3 = RecipeFood.create(quantity: 5, recipe: rec1, food: food3)
