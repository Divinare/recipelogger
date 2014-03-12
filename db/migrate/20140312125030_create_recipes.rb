class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :production_time
      t.integer :style_id
      t.string :instruction

      t.timestamps
    end
  end
end
