#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

# => создание подключения к БД
set :database, "SQLite3:leprosorium.db"

class Post < Activerecord::Base
end

class Comment < Activerecord::Base
end



get '/' do
	erb "Hello!"			
end