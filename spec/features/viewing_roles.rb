require 'spec_helper'

feature "Viewing roles" do
  scenario "Listing all roles" do
    role = FactoryGirl.create(:role, name: "Brand new role")
    visit '/'
    click_link 'Brand new role'
    expect(page.current_url).to eql(role_url(role))
  end
end