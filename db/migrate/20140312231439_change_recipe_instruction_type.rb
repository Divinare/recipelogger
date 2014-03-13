class ChangeRecipeInstructionType < ActiveRecord::Migration
  def change
    change_column :recipes, :instruction, :text
  end
end
