class RentabilityCalculatorService

  def self.save_stock(stock = nil)
    res = YahooConnector.get_stock(stock)
    self.parse_and_match_timestamps_and_dates(res)
  end

  protected
  def self.parse_and_match_timestamps_and_dates(res)
    dates_and_prices = {}
    self.timestamps(res).each_with_index do |date, i|
      dates_and_prices[i] = {date: date}
    end
    self.prices(res).each_with_index do |price, i|
      dates_and_prices[i] = dates_and_prices[i].merge({price: price})
    end
    dates_and_prices.each do |k,v|
      puts "criando com data #{v[:date]}"
      Stock.create(price: v[:price], date: Time.at(v[:date]).to_datetime, symbol: self.symbol(res))
    end
  end
  def self.timestamps(res)
    res["chart"]["result"][0]["timestamp"]
  end
  def self.prices(res)
    res["chart"]["result"][0]["indicators"]["quote"][0]["open"]
  end
  def self.symbol(res)
    res["chart"]["result"][0]["meta"]["symbol"]
  end
end