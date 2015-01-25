# Generated with RailsBricks
# Initial seed file to use with Devise User Model

%w(Ruby Python Java C).each do |l|
  Language.create(name: l)
end

# Temporary admin account
User.create(
  email: "admin@hackatron.com",
  password: "1234",
  password_confirmation: "1234",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.country}",
  languages: Language.all,
  admin: true
)



# Test user accounts
(1..50).each do |i|
  User.create(
    email: Faker::Internet.email,
    password: "1234",
    password_confirmation: "1234",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.country}",
    languages: Language.all.sample(rand(1..4)),
    admin: false
  )
end
  

