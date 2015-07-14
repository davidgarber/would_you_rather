require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "the edit a question process" do
  it "edits a question", js: true do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    question = FactoryGirl.create(:question)
    visit questions_path
    click_link "Edit Question"
    fill_in 'Title', :with => "new title"
    fill_in 'Answer a', :with => "new answer a"
    fill_in 'Answer b', :with => "new answer b"
    click_on 'Update Question'
    expect(page).to have_content 'new title'
  end

it "edits a question", js: true do
  user = FactoryGirl.create(:user)
  login_as(user, :scope => :user)
  question = FactoryGirl.create(:question)
  visit questions_path
  click_link "Edit Question"
  fill_in 'Title', :with => ""
  fill_in 'Answer a', :with => ""
  fill_in 'Answer b', :with => ""
  click_on 'Update Question'
  expect(page).to have_content 'errors'
end
end
