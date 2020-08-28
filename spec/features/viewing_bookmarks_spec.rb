require 'pg'

feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmark.create(url: 'http://www.google.co.uk', title: 'Google')
    Bookmark.create(url: 'http://www.skynews.com', title: 'Sky News')


    visit('/bookmarks')

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Google',  href: 'http://www.google.co.uk')
    expect(page).to have_link('Sky News', href: 'http://www.skynews.com')
  end
end
