require 'rails_helper'

feature 'viewing post', %q{
  In order to learn more about what the post
  As an user 
  I want to be able to read the entire post
} do 
  let!(:post) { create :post }

  scenario 'viewing post' do 
    visit posts_path 

    click_on 'Read'

    expect(page).to have_text post.header
    expect(page).to have_text post.body
    expect(page).to have_text post.user.full_name
  end
end
