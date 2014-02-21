require 'spec_helper'

feature 'Paginating roles' do
  let(:role) { FactoryGirl.create(:role) }

  @default_per_page = Kaminari.config.default_per_page
  Kaminari.config.default_per_page = 1
  30.times do |i|
    role = Role.new
    role.name = "Test Role " + i.to_s
    role.description = "Placeholder description"
    role.save
  end

  after do
    Kaminari.config.default_per_page = @default_per_page
  end

  it "displays pagination" do
    all(".pagination .page").count.should == 0
  end

  #scenario 'ddd' do
   # within(".pagination.next") do
    #end
  #end
end