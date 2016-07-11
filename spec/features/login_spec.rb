require 'rails_helper'

RSpec.feature "Login", type: :feature do
  feature "logging in" do

    @user = User.create(email: "example@example.com", password: "password")

    scenario "correct password" do
      visit 'users/sign_in'
      fill_in('user_email', :with => "example@example.com")
      fill_in('user_password', :with => "password")
      click_button('Log in')
      expect(page).to have_content("Signed in successfully.")
    end

    scenario "incorrect password" do
      visit 'users/sign_in'
      fill_in('user_email', :with => "example@example.com")
      fill_in('user_password', :with => "wrong password")
      click_button('Log in')
      expect(page).to have_content("Invalid email or password.")
    end
  end
end