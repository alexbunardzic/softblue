require 'spec_helper'

feature 'Creating Roles' do
  scenario 'can create a role' do
    visit '/'

    click_link 'New Role'

    fill_in 'role[name]', with: 'Test Role'
    fill_in 'role[description]', with: 'A test role'
    click_button 'Create Role'

    expect(page).to have_content('Role has been created.')
  end
end