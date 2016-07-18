require 'rails_helper'

RSpec.feature "Pairing", type: :feature do

    @user = User.create(email: "example@example.com", password: "password", name: "user")
    @user2 = User.create(email: "example2@example.com", password: "password", name: "user2")


    desired_style = "pong"
    category = "Javascript"
    event_type = "Learn"
    earliest_start = Faker::Date.between(3.days.ago, 4.days.from_now)
    latest_start = Faker::Date.between(earliest_start, (earliest_start + 7.days))
    @event = Event.create(host_id: 2, desired_style: desired_style, category: category, earliest_start: earliest_start, latest_start: latest_start, event_type: event_type)


    scenario "Project" do
      visit 'users/sign_in'
      fill_in('user_email', :with => "example@example.com")
      fill_in('user_password', :with => "password")
      click_button('Log in')
      visit '/events/1'
      expect(page).to have_content("Pair with user2")
    end

    # scenario "incorrect password" do
    #   visit 'users/sign_in'
    #   fill_in('user_email', :with => "example@example.com")
    #   fill_in('user_password', :with => "wrong password")
    #   click_button('Log in')
    #   expect(page).to have_content("Invalid email or password.")
    # end
end

# RSpec.feature "Login", type: :feature do
#   feature "logging in" do

#     @user = User.create(email: "example@example.com", password: "password")

#     scenario "correct password" do
#       visit 'users/sign_in'
#       fill_in('user_email', :with => "example@example.com")
#       fill_in('user_password', :with => "password")
#       click_button('Log in')
#       expect(page).to have_content("Signed in successfully.")
#     end

#     scenario "incorrect password" do
#       visit 'users/sign_in'
#       fill_in('user_email', :with => "example@example.com")
#       fill_in('user_password', :with => "wrong password")
#       click_button('Log in')
#       expect(page).to have_content("Invalid email or password.")
#     end
#   end
# end