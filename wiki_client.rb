# Interface between user search terms and Wikipedia API

module WikiClient

  extend self

  require 'wikipedia'

end

if $0 == __FILE__
  search_terms = ARGV[0..-1]
  records = {}
  records[:terms] = []
  search_terms.each do |term|
    record = {}
    record[term.to_sym] = Wikipedia.find( term )
    records[:terms] << record
  end
  p records
end
