# Implement a method substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.
# > dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
# > word_checker("below", dictionary)
# => { "below" => 1, "low" => 1 }

def word_checker(sentence, dictionary=["below","down","go"])
 # I made a hash because I will need to return a hash 
 counter = {}
    #I had to turn the array to a string to use the downcase method. After that I had to make it an array again
    dictionary.join(" ").downcase.split(" ").each do |word| 
        #If the sentence has the word included from my dictionary that means it was found 
        if sentence.downcase.include?(word)
            # When it is found I either make an instance of it in my hash or add one if it was already found before 
            #The scan method works by "scaning" or iterating through my sentence and finding that word 
            #It returns an array of how many times that word was found 
            #"cat catty".scan("cat") => ["cat", "cat" ] 
            # Then I used the count method to count how many times it was found 
            counter[word] = sentence.scan(word).count
        end
    end
    return counter
end
puts word_checker("go, below you go")


