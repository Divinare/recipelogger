class AddPrivateToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :private, :boolean
  end
end
