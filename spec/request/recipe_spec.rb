require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers
  before do
    @user = User.create(name: 'Patrick', password: '123456', email: 'test@gmail.com')
    @recipe = @user.recipes.create(name: 'Chicken')
    sign_in @user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get recipes_path
      expect(response).to have_http_status(:success)
    end
  end
end
