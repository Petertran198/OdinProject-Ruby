# #Implement a method stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
#Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.


def stock_picker(stock_arr)
    highest_profit = 0 
    best_day_to_buy = 0 
    best_day_to_sell = 0 

    # Return 0- 9 but due to "..." it means it will  exclude running the last number 
    for i in 0...stock_arr.length  
        #I am using a nested array so I can keep track of one number and use the other to iterate 
        # Ex. [0, 1-8],[1, 2-8], [2, 3-8], .. [8, 8-8] and so on 
        #I am doing this so I can use the i index postion to keep track of each day 
        # Then I will use the second for loop to iterate through the stock_arr again and compare and calculate
        # those value to what I have in i(the tracked day) 
        # I keep the calculation in profit_calculating until I find the profit_calculating becomes a number with the  highest_profit 
        for j in i+1...stock_arr.length do 
            profit_calculating = stock_arr[j] - stock_arr[i]
           if  highest_profit < profit_calculating
                highest_profit = profit_calculating
                best_day_to_buy = i 
                best_day_to_sell = j                
            end
        end 
    end
    return "[#{best_day_to_buy}, #{best_day_to_sell}] with a profit of #{highest_profit}"

end

puts stock_picker([17,3,6,9,15,8,6,1,10])
