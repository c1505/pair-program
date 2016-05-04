#######below here have already been run.  uncomment if doing a reset or deploying################

Tag.create(name: "Fundamentals")
Tag.create(name: "Algorithms")
Tag.create(name: "Data Types")
Tag.create(name: "Logic")
Tag.create(name: "Control Flow")
Tag.create(name: "Data Structures")
Tag.create(name: "Mathematics")
Tag.create(name: "Object Oriented")


180.times do 
  Tagging.find_or_create_by(event_id: rand(1..20), tag_id: rand(1..7))
end



60.times do 
  event_id = rand(1..60)
  user_id = rand(1..10)
  content = Faker::Hipster.paragraph
  Comment.create(event_id: event_id, user_id: user_id, content: content)
end

###############  exercism ##################
10.times do 
  host_id = rand(1..30)
  desired_style = "pong"
  category = "Javascript"
  event_type = "Exercism"
  title = Faker::Book.title
  repo_link = Faker::Internet.url('example.com')
  earliest_start = Faker::Date.between(3.days.ago, 4.days.from_now)
  latest_start = Faker::Date.between(earliest_start, (earliest_start + 7.days))
  Event.create(host_id: host_id, desired_style: desired_style, category: category, earliest_start: earliest_start, latest_start: latest_start, event_type: event_type, repo_link: repo_link, title: title)
end

10.times do 
  host_id = rand(1..30)
  desired_style = "pong"
  category = "Ruby"
  event_type = "Exercism"
  title = Faker::Book.title
  repo_link = Faker::Internet.url('example.com')
  earliest_start = Faker::Date.between(3.days.ago, 4.days.from_now)
  latest_start = Faker::Date.between(earliest_start, (earliest_start + 7.days))
  Event.create(host_id: host_id, desired_style: desired_style, category: category, earliest_start: earliest_start, latest_start: latest_start, event_type: event_type, repo_link: repo_link, title: title)
end

########### learn ######################
10.times do 
  host_id = rand(1..30)
  desired_style = "pong"
  category = "Javascript"
  event_type = "Learn"
  earliest_start = Faker::Date.between(3.days.ago, 4.days.from_now)
  latest_start = Faker::Date.between(earliest_start, (earliest_start + 7.days))
  Event.create(host_id: host_id, desired_style: desired_style, category: category, earliest_start: earliest_start, latest_start: latest_start, event_type: event_type)
end

10.times do 
  host_id = rand(1..30)
  desired_style = "pong"
  category = "Ruby"
  event_type = "Learn"
  earliest_start = Faker::Date.between(3.days.ago, 4.days.from_now)
  latest_start = Faker::Date.between(earliest_start, (earliest_start + 7.days))
  Event.create(host_id: host_id, desired_style: desired_style, category: category, earliest_start: earliest_start, latest_start: latest_start, event_type: event_type)
end



10.times do 
  host_id = rand(1..30)
  desired_style = "pong"
  category = "Rails"
  event_type = "Learn"
  earliest_start = Faker::Date.between(3.days.ago, 4.days.from_now)
  latest_start = Faker::Date.between(earliest_start, (earliest_start + 7.days))
  Event.create(host_id: host_id, desired_style: desired_style, category: category, earliest_start: earliest_start, latest_start: latest_start, event_type: event_type)
end

10.times do 
  host_id = rand(1..30)
  desired_style = "pong"
  category = "Sinatra"
  event_type = "Learn"
  earliest_start = Faker::Date.between(3.days.ago, 4.days.from_now)
  latest_start = Faker::Date.between(earliest_start, (earliest_start + 7.days))
  Event.create(host_id: host_id, desired_style: desired_style, category: category, earliest_start: earliest_start, latest_start: latest_start, event_type: event_type)
end

30.times do 
  email = Faker::Internet.email 
  name = Faker::Name.name 
  availability = "M #{rand(1..6)}PM-#{rand(7..12)}PM, T #{rand(1..6)}PM-#{rand(7..12)}PM, W #{rand(1..6)}PM-#{rand(7..12)}PM, TH #{rand(1..6)}PM-#{rand(7..12)}PM, F #{rand(1..6)}PM-#{rand(7..12)}PM, S #{rand(6..11)}AM-#{rand(12..12)}PM, SU #{rand(6..11)}AM-#{rand(12..12)}PM"
  application = "screenhero"
  password = "password"
  User.create(email: email, name: name, availability: availability, application: application, password: password)
end
