# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)pet0 = Pet.create!(name: "Michael", date_of_birth: "1959-06-26", species: "Chicken", breed: nil, description: "Interesting under speech rise image smile age street.", price: "500.53")

demo_adopter = Adopter.create!(email: "alice@ilovepets.com", password: "password", name: "Alice Stately", phone_number: "777-777-7777")
demo_adopter_profile = Profile.create!(name: "Alice", description: "I really do love animals!", location: "TN",
    user: demo_adopter, email: "alice@ilovepets.com", phone_number: "777-777-7777")
demo_shelter = Shelter.create!(email: "bob@shelterfriends.com", password: "password", name: "Bob Jones", phone_number: "555-555-5555")
demo_shelter_profile = Profile.create!(name: "Bob", description: "Doing what I can to spread joy.", location: "TN",
    user: demo_shelter, email: "bob@shelterfriends.com", phone_number: '555-555-5555')
demo_pet_1 = Pet.create!(name: "Jack", date_of_birth: "2009-09-11", species: "Dog", breed: "Maltese", description: "The goodest of boys, hands down!", price: "75.00", shelter: demo_shelter)
demo_pet_2 = Pet.create!(name: "Jill", date_of_birth: "2006-06-06", species: "Dog", breed: "Maltese", description: "No better choice if you want a dog that'll fetch.", price: "69.00", shelter: demo_shelter)
demo_pet_3 = Pet.create!(name: "Sarah", date_of_birth: "2013-04-04", species: "Chicken", breed: "Brown", description: "Produces eggs like you wouldn't believe!", price: "125.00", shelter: demo_shelter)
demo_pet_4 = Pet.create!(name: "Charles", date_of_birth: "2014-12-25", species: "Chicken", breed: "Brown", description: "Excellent alarm clock for the mornings.", price: "55.00", shelter: demo_shelter)
demo_pet_5 = Pet.create!(name: "Freddie", date_of_birth: "2004-11-21", species: "Cat", breed: "Spotted", description: "Quite the jovial little guy. Perfect for kids!", price: "75.50", shelter: demo_shelter)
demo_pet_6 = Pet.create!(name: "King", date_of_birth: "2003-07-21", species: "Cat", breed: "Spotted", description: "Not friendly with other pets. Pretty selfish. Great pick-up, though.", price: "115.50", shelter: demo_shelter)
demo_pet_7 = Pet.create!(name: "Ashley", date_of_birth: "2016-03-13", species: "Cat", breed: "Spotted", description: "Great temperament, very kind and sweet!", price: "150.00", shelter: demo_shelter)






user3 = Shelter.create!(email: "test_shelter@test.com", password: "password3", name: "Test McTest", phone_number: "555-555-5555")
profile3 = Profile.create!(name: "The Animal Shelter", description: "Necessary door very should she both. Compare never force buy many other stock miss.", location: "TN",
    user: user3, email: "test_shelter@test.com", phone_number: '555-555-5555')
my_test_adopter = Adopter.create!(email: "james.willson@att.net", password: "password123", name: "James Willson", phone_number: "555-555-5555")
profile1 = Profile.create!(name: "James", description: "Require own dark test trial investment our. Seem news him rather someone what local. Design growth class. Agency fact threat capital experience exist.",
    location: "TN", user: my_test_adopter, phone_number: "512-312-1323", email: "james.willson@att.net")

user2 = Adopter.create!(email: "test_adopt@test.com", password: "password2", name: "Adopter McAdopt", phone_number: "555-555-5555")
profile2 = Profile.create!(name: "Brad", description: "Necessary door very should she both. Compare never force buy many other stock miss.", location: "TN",
    user: user2, email: "test_adopt@test.com")

    user1 = User.create!(email: "test@test.com", password:"password", name: "Test McTest", phone_number: "555-555-5555")
profile4 = Profile.create!(name: "testman", description: "Necessary door very should she both. Compare never force buy many other stock miss.", location: "TN",
    user: user1, email: "test@test.com", phone_number:"555-555-5555")

pet0 = Pet.create!(name: "Gabriel", date_of_birth: "1925-07-13", species: "Dog", breed: "Pointer", description: "Whole perform account activity.", price: "79.57", shelter: user3)
pet1 = Pet.create!(name: "Ashley", date_of_birth: "1970-10-27", species: "Dog", breed: "Cairn Terrier", description: "Part bed pattern buy look.", price: "27.95", shelter: user3)
pet2 = Pet.create!(name: "Kendra", date_of_birth: "2013-06-09", species: "Cat", breed: nil, description: "Report college possible course.", price: "34.79", shelter: user3)
pet3 = Pet.create!(name: "Joseph", date_of_birth: "1955-04-04", species: "Cat", breed: nil, description: "Audience inside similar measure his measure lose others.", price: "21.86", shelter: user3)
pet4 = Pet.create!(name: "Sherry", date_of_birth: "1932-09-17", species: "Dog", breed: "Lakeland Terrier", description: "Hundred project spring.", price: "68.57", shelter: user3)
pet5 = Pet.create!(name: "Jacob", date_of_birth: "1934-03-25", species: "Cat", breed: nil, description: "Nation yeah real very less.", price: "88.10", shelter: user3)
pet6 = Pet.create!(name: "Tyler", date_of_birth: "2002-07-17", species: "Cat", breed: nil, description: "Civil team help suggest child enjoy Congress.", price: "33.69", shelter: user3)
pet7 = Pet.create!(name: "Christine", date_of_birth: "1985-06-29", species: "Dog", breed: "Poodle Standard", description: "Cost per nor own sometimes record image.", price: "95.99", shelter: user3)
pet8 = Pet.create!(name: "Matthew", date_of_birth: "1982-03-02", species: "Chicken", breed: nil, description: "Season many college former person.", price: "15.55", shelter: user3)
pet9 = Pet.create!(name: "Courtney", date_of_birth: "1945-08-12", species: "Chicken", breed: nil, description: "Of control pattern environmental never parent beat.", price: "80.97", shelter: user3)
pet10 = Pet.create!(name: "Kristin", date_of_birth: "2013-01-22", species: "Dog", breed: "Belgian Shepherd Dog Groenendael", description: "Enter recognize top civil guy response speech.", price: "12.05", shelter: user3)
pet11 = Pet.create!(name: "Tanya", date_of_birth: "1965-06-20", species: "Dog", breed: "Shar Pei", description: "Suddenly interest without turn police success really.", price: "64.17", shelter: user3)
pet12 = Pet.create!(name: "Katherine", date_of_birth: "1923-02-10", species: "Cat", breed: nil, description: "System billion capital issue because major.", price: "95.97", shelter: user3)
pet13 = Pet.create!(name: "Angela", date_of_birth: "1941-03-15", species: "Cat", breed: nil, description: "Company live executive age win child perhaps single.", price: "7.27", shelter: user3)
pet14 = Pet.create!(name: "James", date_of_birth: "1920-12-28", species: "Cat", breed: nil, description: "Four need each.", price: "21.62", shelter: user3)
pet15 = Pet.create!(name: "Dylan", date_of_birth: "1916-09-17", species: "Dog", breed: "Bracco Italiano", description: "Better instead look president.", price: "88.51", shelter: user3)
pet16 = Pet.create!(name: "Shelley", date_of_birth: "1916-10-12", species: "Cat", breed: nil, description: "Hundred among woman realize.", price: "89.73", shelter: user3)
pet17 = Pet.create!(name: "Jonathan", date_of_birth: "2005-07-26", species: "Cat", breed: nil, description: "Bill oil road reality.", price: "32.45", shelter: user3)
pet18 = Pet.create!(name: "Sherry", date_of_birth: "1980-09-06", species: "Chicken", breed: nil, description: "Rich measure summer.", price: "66.12", shelter: user3)
pet19 = Pet.create!(name: "Christopher", date_of_birth: "1993-07-07", species: "Cat", breed: nil, description: "Side professor story color body long.", price: "11.19", shelter: user3)
pet20 = Pet.create!(name: "Cathy", date_of_birth: "1948-11-15", species: "Chicken", breed: nil, description: "Receive discover explain catch daughter product.", price: "75.16", shelter: user3)
pet21 = Pet.create!(name: "Jessica", date_of_birth: "1970-10-20", species: "Dog", breed: "Labrador Retriever", description: "Yard current final.", price: "17.33", shelter: user3)
pet22 = Pet.create!(name: "Joshua", date_of_birth: "1958-05-02", species: "Chicken", breed: nil, description: "Prevent send onto tax learn dog card.", price: "23.04", shelter: user3)
pet23 = Pet.create!(name: "Ronald", date_of_birth: "1987-11-23", species: "Dog", breed: "Rottweiler", description: "Rate pattern politics single when.", price: "72.37", shelter: user3)
pet24 = Pet.create!(name: "Bridget", date_of_birth: "2000-05-05", species: "Cat", breed: nil, description: "General idea include go.", price: "0.30", shelter: user3)
pet25 = Pet.create!(name: "Deborah", date_of_birth: "1961-12-31", species: "Chicken", breed: nil, description: "Speak pass modern Democrat television.", price: "54.90", shelter: user3)
pet26 = Pet.create!(name: "Samantha", date_of_birth: "2013-11-08", species: "Cat", breed: nil, description: "Region community writer fire available seven.", price: "20.58", shelter: user3)
pet27 = Pet.create!(name: "David", date_of_birth: "1915-07-05", species: "Cat", breed: nil, description: "Box different term son.", price: "73.02", shelter: user3)
pet28 = Pet.create!(name: "Leslie", date_of_birth: "2015-02-27", species: "Cat", breed: nil, description: "Program car fear sea.", price: "8.29", shelter: user3)
pet29 = Pet.create!(name: "Dr.", date_of_birth: "1950-03-29", species: "Chicken", breed: nil, description: "Clearly half dinner court service.", price: "22.08", shelter: user3)
pet30 = Pet.create!(name: "Julia", date_of_birth: "2000-10-14", species: "Cat", breed: nil, description: "Relate capital beyond option participant sit prove.", price: "97.87", shelter: user3)
pet31 = Pet.create!(name: "Jason", date_of_birth: "1978-12-28", species: "Cat", breed: nil, description: "This could ever have push traditional majority.", price: "61.84", shelter: user3)
pet32 = Pet.create!(name: "Stephen", date_of_birth: "1921-06-20", species: "Cat", breed: nil, description: "Together free collection consider film.", price: "83.66", shelter: user3)
pet33 = Pet.create!(name: "Christine", date_of_birth: "1964-12-24", species: "Dog", breed: "Old English Sheepdog", description: "Air after laugh major keep act.", price: "90.04", shelter: user3)
pet34 = Pet.create!(name: "Steven", date_of_birth: "1998-03-27", species: "Chicken", breed: nil, description: "Fall officer of section learn agent participant.", price: "97.75", shelter: user3)
pet35 = Pet.create!(name: "John", date_of_birth: "2007-04-27", species: "Cat", breed: nil, description: "And exactly material authority else employee space result.", price: "27.78", shelter: user3)
pet36 = Pet.create!(name: "Natalie", date_of_birth: "1923-08-28", species: "Chicken", breed: nil, description: "Skill appear full really.", price: "78.65", shelter: user3)
pet37 = Pet.create!(name: "Pamela", date_of_birth: "1914-12-12", species: "Dog", breed: "German Shepherd Dog", description: "Hear song down add official.", price: "53.35", shelter: user3)
pet38 = Pet.create!(name: "David", date_of_birth: "1933-11-15", species: "Dog", breed: "German Shepherd Dog", description: "Blue still middle produce medical.", price: "19.46", shelter: user3)
pet39 = Pet.create!(name: "Jeffrey", date_of_birth: "1985-08-12", species: "Chicken", breed: nil, description: "Stand buy specific blood.", price: "53.98", shelter: user3)
pet40 = Pet.create!(name: "Sarah", date_of_birth: "1976-12-27", species: "Dog", breed: "Pyrenean Mountain Dog", description: "Upon reality responsibility fact.", price: "54.63", shelter: user3)
pet41 = Pet.create!(name: "Elizabeth", date_of_birth: "1988-08-18", species: "Dog", breed: "Shih Tzu", description: "Medical political sign hold beyond.", price: "16.22", shelter: user3)
pet42 = Pet.create!(name: "Timothy", date_of_birth: "1965-05-26", species: "Chicken", breed: nil, description: "Space agree get stay.", price: "54.83", shelter: user3)
pet43 = Pet.create!(name: "Maria", date_of_birth: "1917-02-21", species: "Dog", breed: "Deerhound", description: "Standard south whatever beyond.", price: "51.68", shelter: user3)
pet44 = Pet.create!(name: "Amy", date_of_birth: "1982-05-20", species: "Dog", breed: "Lakeland Terrier", description: "Wrong east including machine tonight instead pull.", price: "53.52", shelter: user3)
pet45 = Pet.create!(name: "Mary", date_of_birth: "1934-01-01", species: "Chicken", breed: nil, description: "Black create management economic hospital whatever.", price: "69.59", shelter: user3)
pet46 = Pet.create!(name: "Karen", date_of_birth: "1912-06-01", species: "Cat", breed: nil, description: "Listen former one personal truth glass recent enter.", price: "37.78", shelter: user3)
pet47 = Pet.create!(name: "Aaron", date_of_birth: "2014-07-28", species: "Dog", breed: "Nova Scotia Duck Tolling Retriever", description: "Life represent physical design.", price: "96.95", shelter: user3)
pet48 = Pet.create!(name: "Cole", date_of_birth: "1953-12-22", species: "Cat", breed: nil, description: "Call art between son trade moment.", price: "42.71", shelter: user3)
pet49 = Pet.create!(name: "Benjamin", date_of_birth: "1939-11-29", species: "Chicken", breed: nil, description: "Care base somebody receive actually bit next.", price: "95.65", shelter: user3) 

rating1 = Rating.create!(positive: true, adopter: my_test_adopter, pet: pet1, approved: true, viewed: false)
rating2 = Rating.create!(positive: false, adopter: user2, pet: pet2, viewed: false)
rating3 = Rating.create!(positive: true, adopter: user2, pet: pet3, viewed: false)
rating4 = Rating.create!(positive: true, adopter: my_test_adopter, pet: pet4, approved: true, viewed: false)
rating5 = Rating.create!(positive: false, adopter: my_test_adopter, pet: pet5, viewed: false)
rating6 = Rating.create!(positive: true, adopter: user2, pet: pet6, viewed: false)
rating7 = Rating.create!(positive: true, adopter: my_test_adopter, pet: pet7, viewed: false)
rating8 = Rating.create!(positive: true, adopter: user2, pet: pet8, viewed: false)
rating9 = Rating.create!(positive: true, adopter: my_test_adopter, pet: pet9, viewed: false)
rating10 = Rating.create!(positive: true, adopter: user2, pet: pet10, viewed: false)

