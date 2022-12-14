class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :location
      t.text :description
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
