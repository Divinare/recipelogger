class DeleteUserIdFromRecipe < ActiveRecord::Migration
  def change
    remove_column :users, :recipe_id
  end
end
