require "pg"
class Bookmarks
  def self.all
  con = PG.connect :dbname => "bookmark_manager"
  bookmark = con.exec "SELECT * FROM bookmarks;"
  bookmark.map { |bookmark| bookmark['url'] }
  end
end
