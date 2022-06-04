require 'rails_helper'

RSpec.describe 'Chef Show Page' do
    describe "Chef Show Page" do
        before :each do
            @chef = Chef.create!(name: 'Charles')
            @chef2 = Chef.create!(name: 'Barkley')
            @dish_1 = @chef.dishes.create!(name: "Fish", description: "Fresh Caught Salmon")
            @dish_2 = @chef.dishes.create!(name: "Steak", description: "Fresh Caught Cow")
            @dish_3 = @chef2.dishes.create!(name: "Fruit", description: "Fresh Berries")
            @ingredient_1 = Ingredient.create!(name: "Wild Salmon", calories: 100)
            @ingredient_2 = Ingredient.create!(name: "Carrots", calories: 50)
            @ingredient_3 = Ingredient.create!(name: "Steak", calories: 200)
            @ingredient_4 = Ingredient.create!(name: "Blueberries", calories: 20)
            DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
            DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
            DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_2)
            DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_3)
            DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_4)
            visit "/chefs/#{@chef.id}"
        end

        it "displays unique list of chefs ingredients" do
            expect(page).to have_content("Name: Charles") 
            expect(page).to_not have_content("Barkley")
            click_link "List of All Ingredients"
            expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
        end  
    end
    
end