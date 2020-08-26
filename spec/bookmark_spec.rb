require 'bookmarks'
require 'pg'

describe Bookmarks do
  describe '.all' do
    it 'returns all bookmarks' do
      
      con = PG.connect(dbname: 'bookmark_manager_test')

      con.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      con.exec("INSERT INTO bookmarks (url) VALUES('http://www.skynews.com');")
      con.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.co.uk');")

      bookmarks = Bookmarks.all
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.skynews.com")
      expect(bookmarks).to include("http://www.google.co.uk")
    end
  end
end
