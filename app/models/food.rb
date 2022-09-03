class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :recipe_foods, class_name: 'RecipeFood', foreign_key: 'recipe_id', dependent: :destroy
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :user_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1, only_integer: true }
end
