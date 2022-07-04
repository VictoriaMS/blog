require 'rails_helper'

feature 'create comments', %q{
  In order to share your opinion about the post you read
  As an user 
  I want to be able to leave comments
} do 

  let!(:user) { create(:user) }
  let!(:post) { create(:post) }

  scenario 'authenticated user create comment' do 
    sign_in(user)

    visit post_path(post)
    
    fill_in 'comment_body', with: 'New comment for this post'

    click_on 'Comment'

    expect(page).to have_text 'New comment for this post'
  end

  scenario 'guest create comment' do 
    visit post_path(post)
    
    fill_in 'comment_body', with: 'New comment for this post'

    click_on 'Comment'

    expect(page).to have_text 'You need to sign in or sign up before continuing.'
  end
end
