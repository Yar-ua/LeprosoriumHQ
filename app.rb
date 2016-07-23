#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'SQLite3'
require 'sinatra/activerecord'

# => создание подключения к БД
set :database, "SQLite3:leprosoriumhq.db"

class Post < ActiveRecord::Base
end

before do
	@posts = Post.all
end

# => --------------------------------------

get '/' do
	erb "Hello!"
	erb :index
end



get '/newpost' do
	@newpost = Post.new
	erb :newpost
end


post '/newpost' do
	@content = params[:content]
	@author = params[:author]
	Post.create(:content => @content,
					:author => @author)

#	@newpost = Post.new params[:post]
#	@newpost.save
#	erb "<h3>Your post was saved</h3>"

#	erb "#{Post.content}"
#	erb "#{Post.author}"
	erb "<h3>Your post was added</h3>"

end