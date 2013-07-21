require 'sinatra'
require 'json'
require './helpers'
require './generator'
# require './wiki_client'

get '/' do
  erb :index
end

get '/api/word/:term/paragraphs/:paragraphs' do
  # ipsum_seed_data = WikiClient.build(term: params[:term], paragraphs: params[:paragraphs])

  # test data until wiki stream is built
  ipsum_seed_data = {text_from_source: "His influence on the Latin language was so immense that the subsequent history of prose in not only 
          Latin but European languages up to the 19th century was said to be either a reaction against or a return to his 
          style.[4] According to Michael Grant, 'the influence of Cicero upon the history of European literature and ideas 
          greatly exceeds that of any other prose writer in any language'. Cicero introduced the Romans to the chief schools 
          of Greek philosophy and created a Latin philosophical vocabulary (with neologisms such as humanitas, 
          qualitas, quantitas, and essential[6] distinguishing himself as a linguist, translator, and philosopher.",
          paragraphs: 5}

  string = Generator.make_multiple_paragraphs(ipsum_seed_data)

  if request.xhr?
    content_type :json
    {'term' => string}.to_json
  end

end
