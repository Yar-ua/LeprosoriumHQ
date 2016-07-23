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
	has_many :comments

	validates :author, presence: true, length: {in: 3..50}
	validates :content, presence: true
end

class Comment <ActiveRecord::Base
	belongs_to :post
end

# => --------------------------------------

get '/' do				# => стартовая страница
	erb "<h3>Hello! Here You can read most famous quotations of wise men and fools!</h3>"
end


get '/index' do			# => отображение списка всех постов
	@posts = Post.order('created_at DESC') 
	erb :index
end


get '/newpost' do		# => вывод формы нового поста
	@newpost = Post.new
	erb :newpost
end


post '/newpost' do		# => получение данных из формы нового поста
	@newpost = Post.new params[:post]
	if @newpost.save
		erb "<h3>Your post was added</h3>"
	else
		@error = @newpost.errors.full_messages.first
		erb :newpost
	end

end

get '/details/:post_id' do
#	comment_num = params[:post_id]
	@results = Post.find(params[:post_id])
	@comments = Comment.where("post_id=?", params[:post_id])

	erb :details
end