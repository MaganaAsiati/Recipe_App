require 'rails_helper'

RSpec.describe 'Public recipe page test', type: :feature do
  describe 'new page' do
    before :each do
      @user = User.create(name: 'Assiati', email: 'assiati@test.com', password: '123456')
      @recipe = @user.recipes.create(name: 'Chicken curry', preparation_time: '2 hours', cooking_time: '1 hour',
                                     description: 'Chicken curry description')

      visit new_user_session_path
      fill_in 'Email', with: 'assiati@test.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
    end

    it 'check public_recipes#index path' do
      visit public_recipes_path
      expect(current_path).to eq(public_recipes_path)
      expect(page).to have_text('Public Recipes')
    end
  end
end