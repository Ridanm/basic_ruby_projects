# https://www.theodinproject.com/lessons/ruby-sub-strings

def substrings(words, dictionary)  
  search_words = words.downcase.split(" ").uniq
  clean_words =  []      
  coincidences = []

  search_words.map { |word| clean_words << word.gsub(/[^\w]/i, '')}
  
  clean_words.map do |word|
    word_two = word[0..-2]
    
    until word.size == 0 
      coincidences << word if dictionary.include?(word)
      word = remove_first_letter(word) 

      coincidences << word_two if dictionary.include?(word_two)
      word_two = remove_last_letter(word_two)
    end
  end

  coincidences.reduce(Hash.new(0)) do |key, value|
    key[value] += 1
    key                                                    
  end
end

def remove_first_letter(word)
  first_letter = word.split('')
  first_letter.shift()
  word = first_letter.join('')
end

def remove_last_letter(word)
  last_letter = word.split('') 
  last_letter.pop() 
  word = last_letter.join('')
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)

# { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }


