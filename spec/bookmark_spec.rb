require 'bookmarks'

describe Bookmarks do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmarks.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.skynews.com")
      expect(bookmarks).to include("http://www.google.co.uk")
    end
  end
end
