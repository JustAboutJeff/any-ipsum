require 'sinatra'
require 'json'
require './helpers'
require './generator'
require './wiki_client'

configure :production do
  require 'newrelic_rpm'
end

get '/' do
  erb :index
end

get '/api/term/:term/paragraphs/:paragraphs' do
  ipsum_seed_data = WikiClient.build(term: params[:term],
                                     paragraphs: params[:paragraphs])

  ipsumText = Generator.make_multiple_paragraphs(ipsum_seed_data)

  content_type :json
  { 'anyIpsum' => ipsumText}.to_json
end
