require 'bookmarks'
require 'pg'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do

      con = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.google.co.uk", title: "Google")
      Bookmark.create(url: "http://www.skynews.com", title: "Sky News")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
  it 'creates a new bookmark' do
    bookmarks = Bookmark.create(url: 'http://www.skynews.com', title: 'Sky News')
    persisted_data = persisted_data(id: bookmarks.id)

    expect(bookmarks).to be_a Bookmark
    expect(bookmarks.id).to eq persisted_data['id']
    expect(bookmarks.title).to eq 'Sky News'
    expect(bookmarks.url).to eq 'http://www.skynews.com'
    end
  end
end
