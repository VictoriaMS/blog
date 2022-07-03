require 'rails_helper'

feature 'create post', %q{
  In order to share information and experiences
  As an user
  I want to be abble to create the post
} do 

  let!(:user) { create :user }

  scenario 'create post' do 
    sign_in(user)
    
    visit new_post_path 

    fill_in "Header", with: "Post's header"
    fill_in "Body", with: "Post's body"

    click_on 'Create Post'

    expect(page).to have_content "Post's header"
    expect(page).to have_content "Post's body"
  end
end
