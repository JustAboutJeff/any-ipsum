# Find the most common significant words in any string 

module Generator

  extend self

  # words with more than 4 characters that should be rejected
  REJECT_THESE_WORDS = %w(such with)

  def clean(string)
    # remove debris (parenthesis, commas, etc.)
    string.gsub(/[(),.:;?!'"]/, '').
    # remove citations in the format: [4]
    gsub(/\[\d\]/, '').
    # break the string into words and put the same words together
    split(' ').sort.
    # reject words less than three characters
    reject{ |word| word.length <= 3}.
    # reject words ID'd as too common
    reject{ |word| REJECT_THESE_WORDS.include?(word)}
  end

  def find_count_by_frequency(word_array)
    # establishes empty hash with default value of 0
    words_by_count = Hash.new(0)
    # find frequency of each word
    word_array.each { |word| words_by_count[word] += 1 }
    # return the hash
    words_by_count
  end

  def id_some_verbs(word_array)
    # find words with common verb endings, but not close to comprehensive
    word_array.select{ |word| word.match(/(ed$|ing$|id$|ise$)/)}
  end


end


if $0 == __FILE__

  topic = {cicero: "His influence on the Latin language was so immense that the subsequent history of prose in not only 
          Latin but European languages up to the 19th century was said to be either a reaction against or a return to his 
          style.[4] According to Michael Grant, 'the influence of Cicero upon the history of European literature and ideas 
          greatly exceeds that of any other prose writer in any language'. Cicero introduced the Romans to the chief schools 
          of Greek philosophy and created a Latin philosophical vocabulary (with neologisms such as humanitas, 
          qualitas, quantitas, and essential[6] distinguishing himself as a linguist, translator, and philosopher."}

  clean_array = Generator.clean(topic[:cicero])

  word_count_hash = Generator.find_count_by_frequency(clean_array)

  p verbs_array = Generator.id_some_verbs(clean_array)

  # puts "How many paragraphs about Cicero?"
  # paragraphs = gets.chomp.to_i

  # puts "How many words per paragraph?"
  # words_per_par = gets.chomp.to_i

end
