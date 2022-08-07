class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.date :date_of_birth
      t.string :species
      t.string :breed
      t.string :description
      t.float :price

      t.timestamps
    end
  end
end
