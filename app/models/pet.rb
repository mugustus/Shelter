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

class Pet < ApplicationRecord

    # Relationships
    # Belongs to shelter relationship
    belongs_to :shelter,
        class_name: "Shelter",
        foreign_key: "shelter_id",
        inverse_of: :pets

    # Rated by adopters relationship
    has_many :ratings
    has_many :rating_adopters, through: :ratings

    # Used for pet images to be uploaded
    has_many_attached :pet_pics

    # Validations
    # Name, dob, and species must be present 
    validates :name, :date_of_birth, :species, presence: true
    # Price must not be to more than two decimal places. 
    validates :price, format: { with: /\A[\d]+([.][\d]{1,2})?\z/, message: "format is invalid" }
    # Price must be greater than 0
    validates :price, numericality: { greater_than: 0, allow_blank: true }    
    # Length of name, species, or breed cannot exceed 50 chars
    validates :name, :species, :breed, length: { maximum: 50 }
    # Description cannot exceed 500 chars
    validates :description, length: { maximum: 500 }
    # Species must be limited to choices: Dog, Cat, or Chicken
    validates :species, inclusion: { in: %w(Dog Cat Chicken), message: "%{value} is not a valid species" }
    # Date of Birth must be greater than current date
    validate :date_of_birth_is_in_past

    def date_of_birth_is_in_past
        errors.add(:date_of_birth, "must be in the past") if 
            !date_of_birth.blank? and date_of_birth >= Date.today + 1
    end

    # Methods 
    # Gets pet with shelter name
    def self.get_pet(pet_id)
        pet = Pet.find_by_sql(['SELECT pets.*, shelter.name AS "shelter_name" FROM pets
            INNER JOIN profiles shelter ON shelter.user_id=pets.shelter_id
            WHERE pets.id=?', pet_id]).first
        return pet
    end

    # Selects a random unrated pet record from the db
    def self.get_next(user_id)
        # See if they're any records left
        count = Pet.count_by_sql(['SELECT COUNT(*) FROM pets WHERE id NOT IN(
            SELECT rated_pet_id FROM ratings WHERE rating_adopter_id=?)', user_id])
        puts 'DEBUG: remaining count = ' + count.to_s
        # if not remove all negative ratings
        if count == 0 
            Rating.where(rating_adopter_id: user_id, positive: false).destroy_all
        end
        # Select a pet only from unrated pets
        pet = Pet.find_by_sql(['SELECT pets.*, shelter.name AS "shelter_name" FROM pets 
            INNER JOIN profiles shelter ON shelter.user_id=pets.shelter_id 
            WHERE pets.id NOT IN(SELECT rated_pet_id FROM ratings 
            WHERE rating_adopter_id=?) ORDER BY RANDOM() LIMIT 1', user_id]).first
        #puts 'DEBUG: retrieved pet id is ' + pet.id.to_s 
        return pet   
    end

    # Get age as string
    def age
        return (Time.now.year - date_of_birth.year > 0) ? "#{(Time.now.year - date_of_birth.year)} Years Old" 
            : "#{((date_of_birth..Time.now).count / 7)} Weeks Old"
    end
end
