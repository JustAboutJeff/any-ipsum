require 'sinatra'
require './helpers'
require './generator'
require './wiki_client'

get '/' do
  erb :index
end

get '/api/word/:term/paragraphs/:paragraphs' do
  ipsum_seed_data = WikiClient.build(term: params[:term], paragraphs: params[:paragraphs])
  if request.xhr?
    {params[:term], Generator.make_multiple_paragraphs(ispum_seed_data)}.to_json
  end
end
