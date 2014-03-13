class FixRecipeColumnName < ActiveRecord::Migration
  def change
      rename_column :recipes, :style_id, :category_id
  end
end
