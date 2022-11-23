class Stock < ApplicationRecord
  def rentability
    RentabilityCalculatorService.calc_rentability(self)
  end

  def as_json(options = {})
    {
      symbol: self.symbol,
      date: self.date,
      price: self.price,
      rentability: rentability
    }
  end
end