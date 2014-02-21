require 'spec_helper'

feature "Creating User Stories" do
  before do
    FactoryGirl.create(:role, name: "Lurker")
    visit '/'
    click_link "Lurker"
    click_link "New User Story"
  end

  scenario "Creating a user story" do
    fill_in "Name", with: "Story 1"
    fill_in "Description", with: "Story 1 description"
  end
end