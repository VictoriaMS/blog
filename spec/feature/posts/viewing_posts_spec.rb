require 'rails_helper'

feature 'wiewing posts', %q{
  In order to be able to search for posts that interest me
  As an user 
  I want to be able to view all posts 
} do 

  let!(:posts) { create_list(:post, 3) }

  scenario 'Any user can view the list of posts' do 
    visit posts_path

    posts.each do |post|
      expect(page).to have_content post.header
      expect(page).to have_text post.body.truncate(200)
    end
  end
end
