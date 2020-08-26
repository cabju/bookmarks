require "pg"
class Bookmarks
  def self.all
    if ENV['RACK_ENV'] = 'test'
      con = PG.connect :dbname => "bookmark_manager_test"
    else
      con = PG.connect :dbname => "bookmark_manager"
    end
  bookmark = con.exec "SELECT * FROM bookmarks;"
  bookmark.map { |bookmark| bookmark['url'] }
  end
end
