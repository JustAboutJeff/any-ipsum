# Find the most common significant words in any string 

module Generator

  extend self

  # words with more than 4 characters that should be rejected
  REJECT_THESE_WORDS = %w(such with that these this those other they their)

  def clean(string)
    # remove debris (parenthesis, commas, etc.), and downcase
    string.gsub(/[(),.:;?!'"]/, '').downcase.
    # remove citations in the format: [4]
    gsub(/\[\d\]/, '').
    # break the string into words, put same words together
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
    passive_verbs = %w[was]
    # find words with common verb endings, but not close to comprehensive
    word_array.select{ |word| word.match(/(ed$|ing$|id$|ise$)/)} + passive_verbs
  end

  def make_paragraph(words_array, words_per_par=7)
    output = ""
    verbs_array = id_some_verbs(words_array)
    other_words = words_array - verbs_array

    until words_per_par <= 0 do
      # Start sentence with capitalized verb/non-verb on a 50/50 split
      first_word = rand(1)
      output << "#{other_words.sample.capitalize} " if first_word == 0
      output << "#{verbs_array.sample.capitalize} " if first_word == 1
      # Put a verb next
      output << "#{verbs_array.sample} "
      # Then 1 to 3 non-verb words
      nonverbs = rand(3)+1
      nonverbs.times { output << "#{other_words.sample} "}
      # Put a verb next half the time
      verb2 = rand(1)
      output << "#{verbs_array.sample} " if verb2 == 1
      # Period after last word
      output << "#{other_words.sample}. "
      # output << verbs_array.sample
      words_per_par -= (3 + nonverbs = verb2)
    end
    output
  end

  def make_multiple_paragraphs(word_array, words_per_par=7, paragraphs=3)
    output = ""
    paragraphs.times do
      output << "#{make_paragraph(word_array, words_per_par)} \n\n"
    end
    output
  end

end


if $0 == __FILE__

  puts "How many paragraphs about Cicero?"
  paragraphs = gets.chomp.to_i

  puts "How many words per paragraph?"
  words_per_par = gets.chomp.to_i

  topic = {cicero: "His influence on the Latin language was so immense that the subsequent history of prose in not only 
          Latin but European languages up to the 19th century was said to be either a reaction against or a return to his 
          style.[4] According to Michael Grant, 'the influence of Cicero upon the history of European literature and ideas 
          greatly exceeds that of any other prose writer in any language'. Cicero introduced the Romans to the chief schools 
          of Greek philosophy and created a Latin philosophical vocabulary (with neologisms such as humanitas, 
          qualitas, quantitas, and essential[6] distinguishing himself as a linguist, translator, and philosopher."}

  clean_array = Generator.clean(topic[:cicero])

  word_count_hash = Generator.find_count_by_frequency(clean_array)

  verbs_array = Generator.id_some_verbs(clean_array)

  one_para = Generator.make_paragraph(clean_array, words_per_par)

  puts many_paras = Generator.make_multiple_paragraphs(clean_array, words_per_par, paragraphs)

end
