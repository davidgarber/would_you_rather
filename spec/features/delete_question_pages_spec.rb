require 'rails_helper'

describe "the process of deleting a question" do
  it "will delete a question" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)
    login_as(user, scope: :user)
    visit questions_path 
    click_link "Delete Question"
    expect(page).to have_no_content(question.title)
  end
end
