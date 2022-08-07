class AddApprovedToRatings < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :approved, :boolean
  end
end
