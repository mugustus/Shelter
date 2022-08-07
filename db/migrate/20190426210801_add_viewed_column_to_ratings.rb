class AddViewedColumnToRatings < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :viewed, :boolean
  end
end
