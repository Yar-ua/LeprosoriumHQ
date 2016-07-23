#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'SQLite3'
require 'sinatra/activerecord'
# => --------------------------------------
# => создание подключения к БД
set :database, "SQLite3:leprosoriumhq.db"

class Post < ActiveRecord::Base
	validates :author, presence: true, length: {in: 3..50}
	validates :content, presence: true
end



before do
	@posts = Post.all
end

# => --------------------------------------

get '/' do
	erb "<h3>Hello! Here You can read most famous quotations of wise men and fools!</h3>"
end


get '/index' do
	@posts = Post.order('created_at DESC') 
	erb :index
end



get '/newpost' do
	@newpost = Post.new
	erb :newpost
end


post '/newpost' do
#	@content = params[:content]
#	@author = params[:author]
#	Post.create(:content => @content,
#					:author => @author)

	@newpost = Post.new params[:post]
	if @newpost.save
		erb "<h3>Your post was added</h3>"
	else
		@error = @newpost.errors.full_messages.first
		erb :newpost
	end

end