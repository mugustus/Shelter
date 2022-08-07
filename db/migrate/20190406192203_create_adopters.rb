class CreateAdopters < ActiveRecord::Migration[5.2]
  def change
    create_table :adopters do |t|

      t.timestamps
    end
  end
end
