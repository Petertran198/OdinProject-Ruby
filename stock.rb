# #Implement a method stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
#Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.
# > stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]  # for a profit of $15 - $3 == $12

#Another way of doing it 


def stock(stock_arr)
    highest_profit = 0 
    best_day_to_buy = 0
    best_day_to_sell = 0 
    stock_arr.each do |stock| 
        for i in stock_arr.index(stock)...stock_arr.length 
            profit = stock_arr[i] - stock 
            if highest_profit < profit 
                highest_profit = profit 
                best_day_to_buy = stock_arr.index(stock)
                best_day_to_sell = i 
            end
        end
    end
    puts "[#{best_day_to_buy},#{best_day_to_sell}]"


end


stock([17,3,6,9,15,8,6,1,10])
