require 'sinatra'
require './helpers'
require './generator'

get '/' do
  
  erb :index
end

