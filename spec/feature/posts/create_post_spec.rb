require 'rails_helper'

feature 'create post', %q{
  In order to share information and experiences
  As an user
  I want to be abble to create the post
} do 

  let!(:user) { create :user }
  let!(:author) { create :user, author: true }

  context 'author create post' do 
    before do 
      sign_in(author)
      visit root_path 
    end

    scenario 'sees link' do 
      expect(page).to have_link 'Write post'
    end

    scenario 'create post' do 
      click_on 'Write post'
  
      fill_in "Header", with: "Post's header"
      fill_in "Body", with: "Post's body"
  
      click_on 'Create Post'
  
      expect(page).to have_content "Post's header"
      expect(page).to have_content "Post's body"
    end
  end

  scenario 'user create post' do 
    sign_in(user)

    visit root_path

    expect(page).to_not have_link 'Write post'
  end
end
