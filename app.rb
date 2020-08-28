require 'sinatra/base'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
  end

get '/bookmarks' do
  @bookmarks = Bookmark.all

  erb :'index'
end

get '/bookmarks/new' do
  erb :'/bookmarks/new'
end

post '/bookmarks' do
  Bookmark.create(url: params[:url], title: params[:title])
  redirect '/bookmarks'
end

  run! if app_file == $0
end
