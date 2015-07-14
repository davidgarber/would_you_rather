require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "the add a comment process" do
  it "adds a comments", js: true do
    visit questions_path
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    question = FactoryGirl.create(:question)
    visit questions_path
    click_link "Add comment"
    fill_in 'Text', :with => 'This rules!'
    click_on 'Create Comment'
    expect(page).to have_content 'This rules!'
  end
end
