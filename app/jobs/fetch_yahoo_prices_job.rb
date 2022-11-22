class FetchYahooPricesJob < ApplicationJob
  queue_as :default
  def perform(stock = nil)
    RentabilityCalculatorService.save_stock(stock)
  end
end