# Classe que busca dados da API Yahoo finance.
class YahooConnector
    include HTTParty
    
    base_uri 'query2.finance.yahoo.com'
    
    parser proc { |body| JSON.parse(body) }
    
    def self.get_stock(stock = nil)
      response = get(
        "/v8/finance/chart/#{stock}",
        headers: { "User-Agent" => "Httparty" }
      ).parsed_response
      return response
    end 
end