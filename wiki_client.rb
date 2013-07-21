# Interface between user search terms and Wikipedia API
require 'wikipedia'


module WikiClient

  extend self

  def build api_request = {}
    paragraph_count = api_request[:paragraphs]
    search_term = api_request[:term]
    ipsum_seed_data = {}
    ipsum_seed_data[:paragraphs] = paragraph_count
    search_term_string = search_term.gsub(' ','_')
    ipsum_seed_text = WikiClient.wiki_clean ( Wikipedia.find( search_term_string ).sanitized_content )
    ipsum_seed_data[:text_from_source] = ipsum_seed_text
    ipsum_seed_data
  end

  def wiki_clean seed_text
    seed_text.gsub!(/[<].{1,2}[>]|\\n/, '')
    seed_text.gsub!(/\\"/,'"')
    seed_text = seed_text.split(/==.*/).first
  end
end

if $0 == __FILE__
  paragraph_count = ARGV[0]
  search_term = ARGV[1..-1]
  puts WikiClient.build(term: search_term, 
                   paragraphs: paragraph_count)
end

