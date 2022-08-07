# == Schema Information
#
# Table name: ratings
#
#  id                :integer          not null, primary key
#  approved          :boolean
#  positive          :boolean
#  viewed            :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  rated_pet_id      :integer
#  rating_adopter_id :integer
#
# Indexes
#
#  index_ratings_on_rated_pet_id       (rated_pet_id)
#  index_ratings_on_rating_adopter_id  (rating_adopter_id)
#

require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "rating should be valid" do
    one = ratings(:one)
    assert one.valid?, one.errors.full_messages.inspect
  end

  test "two ratings from the same adopter should be allowed" do
    one = ratings(:one)
    one.adopter = ratings(:two).adopter
    assert one.valid?, one.errors.full_messages.inspect
  end

  test "two ratings for the same pet should be allowed" do
    one = ratings(:one)
    one.pet = ratings(:two).pet
    assert one.valid?, one.errors.full_messages.inspect
  end 

  test "two ratings between the same pet and adopter shouldn't be allowed" do
    one = ratings(:one)
    one.adopter = ratings(:two).adopter
    one.pet = ratings(:two).pet
    assert_not one.valid?
  end 
  
end
