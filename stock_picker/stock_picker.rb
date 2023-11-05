def stock_picker_refact(days)
  profit = 0
  buy_sell_day = [0, 0]

  days.each do |buy, index|
    days[1..-1].map do |sell|
      next unless sell - buy > profit
      profit = sell - buy
      buy_sell_day = "buy day: #{days.index(buy) + 1} price = #{buy} \nsell day: #{days.index(sell) + 1} price = #{sell}\nprofit = #{profit}"
    end
  end
  return -1 if buy_sell_day == [0, 0]
  buy_sell_day
end

month = [17,3,6,9,15,8,6,1,10]
puts "#{month} \n#{stock_picker_refact(month)}"
  # => [1,4]  # for a profit of $15 - $3 == $12

month = [6,4,1]
puts "\n#{month} \n#{stock_picker_refact(month)}"
# => []

month = [17,21,4,3,6,9,5,8,15,8,6,1,10]
puts "\n#{month} \n#{stock_picker_refact(month)}"
# => [3, 8] # for a profit of $15 - 3 == 12
