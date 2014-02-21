require 'spec_helper'

feature "Deleting Role" do
  before do
    FactoryGirl.create(:role, :name => "Role to be deleted")
    visit '/'
    click_link "Role to be deleted"
  end

  scenario "Deleting a Role" do
    click_link "Delete Role"

    expect(page).to have_content('Role has been destroyed.')

    visit '/'
    expect(page).to have_no_content('Role to be deleted')
  end
end