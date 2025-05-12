# Goal:
# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
def stock_picker(prices:)
  # [<index of buy>, <index of sell>]
  buy_sell_indices = []
  # a most-wanted holder outside of either loop
  best_split = 0

  prices.each_with_index do |num, index|
    # Cannot sell yesterday, but can buy and sell on the same day.
    future_prices = prices[index..-1]

    for sell_price in future_prices do
      would_net = -num + sell_price

      # When this becomes the most wanted
      next unless would_net > best_split

      # record the new most wanted
      best_split = would_net
      # update the indices
      buy_sell_indices = [index, prices.index(sell_price)]
    end
  end

  buy_sell_indices
end

p stock_picker(prices: [17, 3, 6, 9, 15, 8, 6, 1, 10]) # [1,4] for a profit of $15 - $3 == $12
p stock_picker(prices: [1, 3, 5, 7, 9, 11, 13, 15]) # [0,7] for a profit of $15 - $1 == $14
