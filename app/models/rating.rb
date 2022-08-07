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

class Rating < ApplicationRecord

    # Relationships
    belongs_to :pet,
        class_name: "Pet",
        foreign_key: "rated_pet_id",
        inverse_of: :ratings
    belongs_to :adopter,
        class_name: "Adopter",
        foreign_key: "rating_adopter_id",
        inverse_of: :ratings

    # Validations
    # Should not allow two ratings between the same pet and adopter
    validates :rated_pet_id, uniqueness: { scope: [:rating_adopter_id] }

    # Methods
    # Returns all ratings (including pet and adopter info) which apply to a given shelter
    def self.get_positive(shelter_id)
        ratings = Rating.find_by_sql(['SELECT *, profiles.*, profiles.name AS "adopter_name", profiles.description AS "adpr_description", pets.name AS "pet_name",  
            pets.id AS "pet_id", ratings.id AS "rating_id", profiles.email AS "adopter_email", profiles.id AS "profile_id", profiles.phone_number AS "a_phone"
            FROM profiles INNER JOIN ratings ON profiles.user_id=ratings.rating_adopter_id 
            LEFT JOIN pets ON pets.id=ratings.rated_pet_id LEFT JOIN users shelter ON pets.shelter_id=shelter.id 
            WHERE ratings.positive=1 AND shelter.id=? ORDER BY ratings.created_at DESC', shelter_id])
        return ratings
    end
    # Returns count of positive ratings not viewed by shelter
    def self.get_positive_count(shelter_id)
        count = Rating.count_by_sql(['SELECT COUNT(*) FROM profiles INNER JOIN ratings ON profiles.user_id=ratings.rating_adopter_id 
            LEFT JOIN pets ON pets.id=ratings.rated_pet_id LEFT JOIN users shelter ON pets.shelter_id=shelter.id 
            WHERE ratings.positive=1 AND shelter.id=? AND ratings.approved IS NULL', shelter_id])
        return count
    end
    # Returns all matches for given adopter
    def self.get_matches(adopter_id)
        ratings = Rating.find_by_sql(['SELECT pets.*, pets.name AS "pet_name", pets.id AS "pet_id", profiles.* FROM ratings INNER JOIN pets ON pets.id=ratings.rated_pet_id INNER JOIN users shelter ON shelter.id=pets.shelter_id 
            INNER JOIN profiles ON shelter.id=profiles.user_id WHERE rating_adopter_id=? AND approved=1 ORDER BY ratings.created_at DESC', adopter_id])
        return ratings
    end
    # Gets number of new matches
    def self.get_new_matches_count(adopter_id)
        count = Rating.count_by_sql(['SELECT COUNT(*) FROM ratings WHERE ratings.rating_adopter_id=? AND ratings.viewed=0 AND ratings.approved=1', adopter_id])
        return count
    end
    # Gets a new match to view
    def self.get_new_match(adopter_id)
        match = Rating.find_by_sql(['SELECT ratings.id AS "id", pets.name AS "pet_name", pets.species, pets.id AS "pet_id", shelter.name AS "shelter_name", shelter.phone_number, shelter.email, shelter.id AS "shelter_id"
            FROM ratings INNER JOIN pets ON ratings.rated_pet_id=pets.id INNER JOIN profiles shelter ON shelter.user_id=pets.shelter_id
            WHERE ratings.rating_adopter_id=? AND ratings.viewed=0 AND ratings.approved=1', adopter_id]).first
        return match
    end
end
