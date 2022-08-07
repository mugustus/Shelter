# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  type                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "user should be valid" do
    one = users(:one)
    profile = profiles(:one)
    one.update(profile: profile)
    #puts one.profile.nil?
    assert one.valid?, one.errors.full_messages.inspect
  end

  # test "user should always have profile" do
  #   one = users(:one)
  #   one.update(profile: nil)
  #   assert_not one.valid?
  # end

  test "User is invalid: Null email" do
    user = users(:one)
    user.email = nil
    assert user.invalid?
  end

end
