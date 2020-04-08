# A Caesar cipher, also known as Caesar’s cipher, the shift cipher, Caesar’s code or Caesar shift, is one of the simplest and most widely known encryption techniques. It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet. 

def cipher(phrase, number=5)
    phrase_split = phrase.split("") 
    uppercase = ('A'..'Z').to_a
    lowercase = ('a'..'z').to_a
    new_code = ""  #This is to store the new word
    phrase_split.each do |letter| 
        if uppercase.include?(letter) #If the uppercase array include the letter 
            # WE will use 5 position to the right as our example 
            #This is to move that letter, 5 postion to the right for our cipher, Ex A will become F
            #This is because A will start at 0, and upper[5] will return F  
            new_index = uppercase.index(letter) + number
            #26 is the length of the alphabet. 
            # Since we made the upper alphabet an array the last letter Z is of index postion 25 
            # Say if the last letter is Z(index 25), and we add 5 more to it
            #It will return 30 
            # 30 % 26 will give me 4 
            #This is because 30 goes into 26, 26 times and return a remainder of 4 
            moved_position = new_index % 26  
            new_code += uppercase[moved_position]
        elsif lowercase.include?(letter) #if the lowercase array include the letter 
            #This is to move each letter five postion to the right for our cipher 
            new_index = lowercase.index(letter) + number 
            # We than use modulus as a way to wrap z to a 
            # THis won't hinder our application at all because A is at index 0 and 0 % 26 will still return 0
            #z on the other hand with the index 25 +5(to the right) will give me 30  
            # 30 % 26 will return me 4 because 30 will go into 26, 26 times with a remainder of 4 
            # With the index of 4 we made Z move five position because array starts at 0
            new_position = new_index % 26 
            new_code += lowercase[new_position]
        else #Else if it is not a letter than just add it to the sentence
            new_code += letter
        end
    end
    return new_code
end

cipher("What a string!", 5) # => "Bmfy f xywnsl!"



