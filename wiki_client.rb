# Interface between user search terms and Wikipedia API

module WikiClient

  extend self

  require 'wikipedia'
  require './helpers'

  def build api_request = {}
    paragraph_count = api_request[:paragraphs]
    search_term = api_request[:term]
    ipsum_seed_data = {}
    ipsum_seed_data[:paragraphs] = paragraph_count
    search_term_string = Helpers.titleize(search_term).gsub(' ','_')
    search_result = Wikipedia.find( search_term_string ).sanitized_content
    search_result = Wikipedia.find('bacon').sanitized_content unless search_result && search_result.length > 0
    ipsum_seed_text = WikiClient.wiki_clean search_result
    ipsum_seed_data[:text_from_source] = ipsum_seed_text
    ipsum_seed_data
  end

  def wiki_clean seed_text
    seed_text.gsub!(/[<].{1,2}[>]|\\n/, '')
    seed_text.gsub!(/\\"/,'"')
    seed_text.split(/==.*/).first
  end
end

if $0 == __FILE__
  paragraph_count = ARGV[0]
  search_term = ARGV[1..-1].join(" ")
  puts WikiClient.build(term: search_term,
                        paragraphs: paragraph_count)
end
