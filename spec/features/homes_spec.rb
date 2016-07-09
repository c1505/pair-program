require 'rails_helper'

RSpec.feature "Homes", type: :feature do
  describe "home page" do

    context "logged in" do
      @user = User.create(email: "example@example.com", password: "password")
    end

    it "logs in the user successfully and displays a flash message" do
      visit 'users/sign_in'
      fill_in('user_email', :with => "example@example.com")
      fill_in('user_password', :with => "password")
      click_button('Log in')
      expect(page).to have_content("Signed in successfully.")
    end

    it "shows the home page" do
      visit '/'
      expect(page).to have_content("Welcome")
    end
  end
end

# what to test for
# home page
# links exist
# when signed out, sign in link appears
# when signed in, sign out link appears

# '/exercisms'

# after creating an event, 
#   event shows up
#   tag shows up

# authentication
# only when logged in

  # pair
  # cancel PAIRING

  # create an event


# click button pair with person
  # sets guest as the person who clicked button
# EXERCISM PAIRING BUTTON IS CURRENTLY BROKEN