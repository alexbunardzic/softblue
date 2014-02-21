require 'spec_helper'

feature 'Creating Roles' do

  before do
    visit '/'
    click_link 'New Role'
  end

  scenario 'can create a role' do
    fill_in 'role[name]', with: 'Test Role'
    fill_in 'role[description]', with: 'A test role'
    click_button 'Create Role'

    expect(page).to have_content('Role has been created.')

    role = Role.where(name: "Test Role").first
    expect(page.current_url).to eql(role_url(role))
    title = "Test Role - Roles - Softblue"
    expect(page).to have_title(title)
  end

  scenario 'cannot create a role without a name' do
    click_button 'Create Role'

    expect(page).to have_content("Role has not been created.")
    expect(page).to have_content("Name can't be blank")
  end

end
