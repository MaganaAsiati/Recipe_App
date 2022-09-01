class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User', dependent: :destroy
  has_many :recipe_foods, class_name: 'RecipeFood', foreign_key: 'recipe_id'

  validates :name, presence: true, length: { maximum: 50 }
  validates :preparation_time, presence: true, length: { maximum: 50 }
  validates :cooking_time, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 50 }
end
