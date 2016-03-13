# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |f|
  host_id = rand(1..10)
  desired_style = "pong"
  category = "Ruby"
  earliest_start = Faker::Date.between(3.days.ago, 4.days.from_now)
  latest_start = Faker::Date.between(earliest_start, (earliest_start + 7.days))
  Event.create(host_id: host_id, desired_style: desired_style, category: category, earliest_start: earliest_start, latest_start: latest_start)
end

10.times do |f|
  email = Faker::Internet.email 
  name = Faker::Name.name 
  availability = "M #{rand(1..6)}PM-#{rand(7..12)}PM, T #{rand(1..6)}PM-#{rand(7..12)}PM, W #{rand(1..6)}PM-#{rand(7..12)}PM, TH #{rand(1..6)}PM-#{rand(7..12)}PM, F #{rand(1..6)}PM-#{rand(7..12)}PM, S #{rand(6..11)}AM-#{rand(12..12)}PM, SU #{rand(6..11)}AM-#{rand(12..12)}PM"
  application = "screenhero"
  password = "password"
  User.create(email: email, name: name, availability: availability, application: application, password: password)
end
