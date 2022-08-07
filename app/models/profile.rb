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

class Profile < ApplicationRecord
    belongs_to :user,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :profile

    has_one_attached :profile_pic
    
end
