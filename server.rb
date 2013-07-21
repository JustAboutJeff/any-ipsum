require 'sinatra'
require 'json'
require './helpers'
require './generator'
require './wiki_client'

get '/' do
  erb :index
end

get '/api/term/:term/paragraphs/:paragraphs' do
  ipsum_seed_data = WikiClient.build(term: params[:term], 
                          paragraphs: params[:paragraphs])

  loremText = Generator.make_multiple_paragraphs(ipsum_seed_data)

  content_type :json
  { 'anyLorem' => loremText}.to_json

end
