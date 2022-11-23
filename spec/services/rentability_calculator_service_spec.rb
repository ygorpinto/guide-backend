require 'rails_helper'

describe RentabilityCalculatorService do
  context 'calc first item rentability' do
    let!(:stock1) { Stock.create(price:23.00, date:Time.now.to_datetime, symbol:"PETR3") }
    let!(:stock2) { Stock.create(price:23.05, date:Time.now.to_datetime, symbol:"PETR3") }
    
    it 'expect to return 0' do
      expect(RentabilityCalculatorService.calc_rentability(stock1)).to eq 0
    end
  end 

  context 'calc 2 item rentability' do
    let!(:stock1) { Stock.create(price:23.00, date:Time.now.to_datetime, symbol:"PETR3") }
    let!(:stock2) { Stock.create(price:23.05, date:Time.now.to_datetime, symbol:"PETR3") }
    
    it 'expect to return calc rentability' do
      expect(RentabilityCalculatorService.calc_rentability(stock2)).to eq 0.21739130434783593
    end
  end 
end