# == Schema Information
#
# Table name: pets
#
#  id            :integer          not null, primary key
#  breed         :string
#  date_of_birth :date
#  description   :string
#  name          :string
#  price         :float
#  species       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  shelter_id    :integer
#
# Indexes
#
#  index_pets_on_shelter_id  (shelter_id)
#

require 'test_helper'

class PetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "pet should be valid" do 
    one = pets(:one)
    assert one.valid?, one.errors.full_messages.inspect
  end

  test "pet's name should not be blank" do
    one = pets(:one)
    one.name = nil
    assert_not one.valid?
  end

  test "pet's date of birth should not be blank" do
    one = pets(:one)
    one.date_of_birth = nil
    assert_not one.valid?
  end

  test "pet's species should not be blank'" do
    one = pets(:one)
    one.species = nil
    assert_not one.valid?
  end

  test "pet's price should not be negative" do 
    one = pets(:one)
    one.price = -1.00
    assert_not one.valid?
  end

  test "pet's price should not be in an incorrect format" do
    one = pets(:one)
    one.price = 1.0001
    assert_not one.valid?
  end

  test "pet's name should not be longer then 50 char" do
    one = pets(:one)
    one.name = "x" * 51
    assert_not one.valid?
  end

  test "pet's species should not be longer then 50 char" do
    one = pets(:one)
    one.species = "x" * 51
    assert_not one.valid?
  end

  test "pet's breed should not be longer then 50 char" do
    one = pets(:one)
    one.breed = "x" * 51
    assert_not one.valid?
  end

  test "pet's description should not be longer then 500 char" do
    one = pets(:one)
    one.description = "x" * 501
    assert_not one.valid?
  end

  test "pet's species has to one of the included types" do
    one = pets(:one)
    one.species = "Jellyfish"
    assert_not one.valid?
  end

  test "pet's date of birth must be in the past" do
    one = pets(:one)
    one.date_of_birth = Date.today + 1
    assert_not one.valid?
  end

  test "pet should not be without a shelter" do
    one = pets(:one)
    one.shelter = nil
    assert_not one.valid?
  end

end
