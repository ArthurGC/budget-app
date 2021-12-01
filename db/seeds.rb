# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(
  email: 'admin@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Admin',
)
user.save!

user1 = User.new(
  email: 'guilherme@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Guilherme'
)
user1.save!

user2 = User.new(
  email: 'gabriel@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Gabriel'
)
user2.save!

group = Group.create(
    name: "Food",
    icon: 'food.png',
    author_id: user.id
)
group1 = Group.create(
    name: "Books",
    icon: 'books.png',
    author_id: user1.id
)
group2 = Group.create(
    name: "Vacations",
    icon: 'vacations.png',
    author_id: user2.id
)

purchase = Purchase.create(
    name: "Roast chicken",
    amount: 1,
    author_id: user.id
)
group.purchases << purchase

purchase1 = Purchase.create(
    name: "Harry Potter",
    amount: 5,
    author_id: user1.id
)
group1.purchases << purchase1

purchase2 = Purchase.create(
    name: "Hotel",
    amount: 1,
    author_id: user2.id
)
group2.purchases << purchase2

ActiveRecord::Base.connection.tables.each do |t|
ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
