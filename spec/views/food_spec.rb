require 'rails_helper'

RSpec.describe 'Food page test', type: :feature do
  describe 'index page' do
    before :each do
      @user = User.create(name: 'Assiati', email: 'assiati@test.com', password: '123456')
      @food = @user.foods.create(name: 'Beef', measurement_unit: 'kg', price: 2, quantity: 3)

      visit new_user_session_path
      fill_in 'Email', with: 'assiati@test.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
    end

    it 'check foods#index path' do
      visit '/'
      expect(current_path).to eq(root_path)
      expect(page).to have_text('Welcome to Recipe App')
    end

    it 'Should display all user food details' do
      visit foods_path
      expect(page).to have_content('Beef')
      expect(page).to have_content('kg')
      expect(page).to have_content('2.0')
    end

    it "Should navigate to food's new page" do
      visit foods_path
      click_link 'Create New food'
      expect(current_path).to eq(new_food_path)
    end
  end
end