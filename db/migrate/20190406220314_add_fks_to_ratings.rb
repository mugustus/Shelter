class AddFksToRatings < ActiveRecord::Migration[5.2]
  def change
    add_reference :ratings, :rating_adopter, foreign_key: true
    add_reference :ratings, :rated_pet, foreign_key: true
  end
end
