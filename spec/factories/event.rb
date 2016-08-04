FactoryGirl.define do
  factory :event do
    desired_style  "pong"
    category  "Sinatra"
    event_type  "Learn"
    host_id 1
    earliest_start {Faker::Date.between(3.days.ago, 4.days.from_now) }
    latest_start {Faker::Date.between(1.days.ago, 20.days.from_now) }
  end
end


    # desired_style = "pong"
    # category = "Sinatra"
    # event_type = "Learn"
    # earliest_start = Faker::Date.between(3.days.ago, 4.days.from_now)
    # latest_start = Faker::Date.between(earliest_start, (earliest_start + 7.days))
    # event = Event.new(host_id: host_id, desired_style: desired_style, category: category, earliest_start: earliest_start, latest_start: latest_start, event_type: event_type)