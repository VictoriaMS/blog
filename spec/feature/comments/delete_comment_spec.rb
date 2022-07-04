require 'rails_helper'

feature 'delete comment', %q{
  In order to remove irrelevant information
  As a commentator
  I want to be able to delete my comment
} do 
  let!(:user) { create(:user) }
  let!(:commentator) { create(:user) }
  let!(:comment) { create(:comment, user: commentator) }

  scenario 'commentator delete own comment' do 
    sign_in(commentator)

    visit post_path(comment.post)

    click_on 'Delete'

    expect(page).to_not have_text comment.body
  end

  scenario 'authrnticated user delete comment' do 
    sign_in(user)

    visit post_path(comment.post)

    expect(page).to_not have_link 'Delete'
  end
end
