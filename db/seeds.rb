# Predefinied languages
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
(1..50).each do
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

locations = CSV.parse(File.read('db/locations.csv'), headers: false)
locations.each do |location|
  Event.create(
    creator: User.all.sample,
    title: Faker::Company.catch_phrase,
    description: Faker::Company.catch_phrase,
    address: location.join(', '),
    time: (5..300).to_a.sample.days.from_now,
    language: Language.all.sample
  )
end
