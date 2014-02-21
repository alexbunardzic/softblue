require 'spec_helper'

feature "Editing roles" do
  before do
    FactoryGirl.create(:role, :name => "Brand New Role")

    visit '/'
    click_link 'Brand New Role'
    click_link 'Edit Role'
  end

  scenario "Updating a role" do
    fill_in "role[name]", with: "Brand New Role modified"

    click_button "Update Role"

    expect(page).to have_content("Role has been updated.")
  end

  scenario "Updating a role with invalid attributes is totally unacceptable" do
    fill_in "role[name]", with: ""

    click_button "Update Role"

    expect(page).to have_content("Role has not been updated.")
    expect(page).to have_content("Name can't be blank")
  end
end