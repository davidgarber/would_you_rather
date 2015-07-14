require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "the add a question process" do
  it "adds a question", js: true do
    visit questions_path
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    click_link 'New Question'
    fill_in 'Title', :with => 'What day is it?'
    fill_in 'Answer a', :with => 'Monday'
    fill_in 'Answer b', :with => 'Tuesday'
    click_on 'Create Question'
    expect(page).to have_content 'Monday'
  end

  it "errors if fields left blank", js: true do
    visit questions_path
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    click_link 'New Question'
    fill_in 'Title', :with => ''
    fill_in 'Answer a', :with => ''
    fill_in 'Answer b', :with => ''
    click_on 'Create Question'
    expect(page).to have_content 'errors'
  end

end
