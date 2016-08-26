require 'rails_helper'

feature "Pairing" do

    @user = User.create(email: "example@example.com", password: "password", name: "user")
    @user2 = User.create(email: "example2@example.com", password: "password", name: "user2")


    desired_style = "pong"
    category = "Javascript"
    event_type = "Learn"
    earliest_start = Faker::Date.between(3.days.ago, 4.days.from_now)
    latest_start = Faker::Date.between(earliest_start, (earliest_start + 7.days))
    @event = Event.create(host_id: 2, desired_style: desired_style, category: category, earliest_start: earliest_start, latest_start: latest_start, event_type: event_type)


    scenario "Project event allows for pairing" do
      visit 'users/sign_in'
      fill_in('user_email', :with => "example@example.com")
      fill_in('user_password', :with => "password")
      click_button('Log in')
      visit '/events/1'
      click_button("Pair with user2")
      expect(page).to have_content("You have a partner!")
      click_button("Cancel Pairing")
      expect(page).to have_content("Pairing canceled")
    end
    
    desired_style = "pong"
    category = "Javascript"
    event_type = "Exercism"
    title = Faker::Book.title
    repo_link = Faker::Internet.url('example.com')
    earliest_start = Faker::Date.between(3.days.ago, 4.days.from_now)
    latest_start = Faker::Date.between(earliest_start, (earliest_start + 7.days))
    @exercism_event = Event.create(title: title, repo_link: repo_link, host_id: 2, desired_style: desired_style, category: category, earliest_start: earliest_start, latest_start: latest_start, event_type: event_type)

    
    scenario "Exercism event allows for pairing" do
      visit 'users/sign_in'
      fill_in('user_email', :with => "example@example.com")
      fill_in('user_password', :with => "password")
      click_button('Log in')
      
      visit '/exercisms/1'
      click_button("Pair with user2")
      expect(page).to have_content("You have a partner!")
      click_button("Cancel Pairing")
      expect(page).to have_content("Pairing canceled")
    end


end

