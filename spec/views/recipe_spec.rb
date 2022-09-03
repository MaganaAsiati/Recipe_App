require 'rails_helper'

RSpec.describe 'Recipe page test', type: :feature do
  describe 'index page' do
    before :each do
      @user = User.create(name: 'Patrick', email: 'test@gmail.com', password: '123456')
      @recipe = @user.recipes.create(name: 'Chicken Curry', preparation_time: '1.0', cooking_time: '1.0',
                                     description: 'Some chicken description')

      visit new_user_session_path
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
    end

    it 'check recipes#index path' do
      visit recipes_path
      expect(current_path).to eq(recipes_path)
      expect(page).to have_text('New recipe')
    end

    it "Should navigate to recipe's new page" do
      visit recipes_path
      click_link 'New recipe'
      expect(current_path).to eq(new_recipe_path)
    end
  end

  describe 'show page' do
    before :each do
      @user = User.create(name: 'Asiati', email: 'test2@gmail.com', password: '123456')
      @recipe = @user.recipes.create(name: 'Chicken Curry', preparation_time: '1.0', cooking_time: '1.0',
                                     description: 'Some chicken description')

      visit new_user_session_path
      fill_in 'Email', with: 'test2@gmail.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
    end

    it 'check recipes#show path' do
      visit "/recipes/#{@recipe.id}"
      expect(current_path).to eq("/recipes/#{@recipe.id}")
      expect(page).to have_text('Recipe description')
    end
  end
end
