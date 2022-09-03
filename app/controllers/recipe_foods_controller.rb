class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show edit update destroy]

  # GET /recipes_foods or /recipes_foods.json
  def index
    @recipe_foods = RecipeFood.all
  end

  # GET /recipes_foods/1 or /recipes_foods/1.json
  def show; end

  # GET /recipes_foods/new
  def new
    @recipe_food = RecipeFood.new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.where(user_id: current_user.id)
  end

  # POST /recipes_foods or /recipes_foods.json
  def create
    @foods = Food.where(user_id: current_user.id)
    @food = Food.find(recipe_food_params['food'])
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new(quantity: recipe_food_params['quantity'].to_i, food: @food, recipe: @recipe)

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipes_path, notice: 'Recipes food was successfully created.' }
        format.json { render :show, status: :created, location: @recipes_foods }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipes_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes_foods/1 or /recipes_foods/1.json
  def destroy
    @recipe_food.destroy

    respond_to do |format|
      format.html { redirect_to recipesFoods_url, notice: 'Recipes food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipesFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:food, :quantity)
  end
end