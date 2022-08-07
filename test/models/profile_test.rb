# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  description  :text
#  email        :string
#  location     :string
#  name         :string
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "profile is valid" do
    one = profiles(:one)
    assert one.valid?, one.errors.full_messages.inspect
  end
end
