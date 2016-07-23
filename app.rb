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


#class Comment < ActiveRecord::Base
#end



get '/' do
	erb "Hello!"
#	erb :index
end