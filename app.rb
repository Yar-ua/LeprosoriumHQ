#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

# => создание подключения к БД

class Post < ActiveRecord::Base

end


#class Comment < ActiveRecord::Base
#end



get '/' do
	erb "Hello!"			
end