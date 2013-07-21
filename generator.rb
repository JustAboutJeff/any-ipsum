module Generator

  extend self

  def parse
  end

end


if $0 == __FILE__

topic = {cicero: "His influence on the Latin language was so immense that the subsequent history of prose in not only 
        Latin but European languages up to the 19th century was said to be either a reaction against or a return to his 
        style.[4] According to Michael Grant, 'the influence of Cicero upon the history of European literature and ideas 
        greatly exceeds that of any other prose writer in any language'.Cicero introduced the Romans to the chief schools 
        of Greek philosophy and created a Latin philosophical vocabulary (with neologisms such as humanitas, 
        qualitas, quantitas, and essentia)[6] distinguishing himself as a linguist, translator, and philosopher."}

puts "How many paragraphs about Cicero?"
paragraphs = gets.chomp.to_i

puts "How many words per paragraph?"
words_per_par = gets.chomp.to_i

p Generator.parse(topic[:cicero])

end
