# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do
  restaurant = Restaurant.new(
    name: Faker::Company.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: Restaurant::CATEGORIES.sample
  )

  restaurant.save
  puts "Restaurant created !"
  5.times do
    review = Review.new(
      content: Faker::Quote.yoda,
      rating:(0..5).to_a.sample
    )
    review.restaurant_id = restaurant.id
    review.save!
  end
end
