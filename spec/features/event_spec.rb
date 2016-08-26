require 'rails_helper'

feature 'Event' do 
  scenario 'Can create an Exercism Event' do
    visit '/exercisms'
    click_link("Host an Event")
    fill_in('event_title', :with => 'title')
    fill_in('earliest_start', :with => '01/01/2002')
    fill_in('latest_start', :with => '01/01/2002')
  end
  
  scenario 'Can create a Project Event' do 
    # skip
  end
    
end