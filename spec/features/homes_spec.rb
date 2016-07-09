require 'rails_helper'

RSpec.feature "Homes", type: :feature do
  describe "home page" do
    it "shows the home page" do
      visit '/'
      expect(page).to have_content("Welcome")
    end
  end
end
