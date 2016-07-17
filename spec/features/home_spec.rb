require 'rails_helper'

RSpec.feature "Home", type: :feature do
  feature "home page" do
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