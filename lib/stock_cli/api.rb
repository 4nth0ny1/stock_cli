class Api

    attr_accessor :url, :url_2

    def initialize
        @url = 'https://cloud.iexapis.com/stable/stock'
        @url_2 = 'batch?types=quote,news,chart&range=1m&last=10&token=pk_64a3b816353a4d439a1ab35e94c99d32'
    end 

    def search_company_by_symbol(input)
        req_url = "#{url}/#{input}/#{url_2}"
        data = HTTParty.get(req_url)
        # binding.pry
        if data["quote"] 
        
            stock_hash = {
                symbol: data["quote"]["symbol"],
                companyName: data["quote"]["companyName"],
                primaryExchange: data["quote"]["primaryExchange"],
                close: data["quote"]["close"],
                volume: data["quote"]["volume"],
                peRatio: data["quote"]["peRatio"],
                marketCap: data["quote"]["marketCap"],
                week52High: data["quote"]["week52High"],
                week52Low: data["quote"]["week52Low"]
            }   
    
            stock = Stock.new(stock_hash) 
            stock
        end
    end 
end
