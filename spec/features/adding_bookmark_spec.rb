require "pg"

feature "adding bookmarks" do
  scenario "type url into form" do
    visit "/bookmarks/new"
    fill_in :url, with: "www.instagram.com"
    fill_in('title', with: 'Instagram')
    click_button "add"
    expect(page).to have_link('Instagram', href: 'www.instagram.com')
  end
end
