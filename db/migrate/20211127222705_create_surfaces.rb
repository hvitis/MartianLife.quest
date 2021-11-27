class CreateSurfaces < ActiveRecord::Migration[6.0]
  def change
    create_table :surfaces do |t|
      t.integer :x
      t.integer :y
      t.boolean :is_life
      t.boolean :is_water

      t.timestamps
    end
  end
end
