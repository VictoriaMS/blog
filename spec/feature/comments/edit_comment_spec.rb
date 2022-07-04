require 'rails_helper'

feature 'edit comment', %q{
  In order to correct or add your opinion to your comment
  As commenter
  I want to be able to edit my comment
} do 
  let!(:commenter) { create(:user) }
  let!(:user) { create(:user) }
  let!(:comment) { create(:comment, user: commenter) }

  scenario 'commenter edit comment', js: true do 
    sign_in(commenter)
    visit post_path(comment.post)

    click_on 'Edit comment' 

    within '.edit' do 
      fill_in 'comment_body', with: 'Edit comment'
    end 

    click_on 'Update Comment'

    expect(page).to_not have_content comment.body
    expect(page).to have_content 'Edit comment'
  end

  scenario 'user edit comment' do 
    sign_in(user)

    visit post_path(comment.post)
    
    expect(page).to_not have_link 'Edit'
  end
end
