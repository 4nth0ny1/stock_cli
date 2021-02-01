class Api

    attr_accessor :url, :url_2

    def initialize
        @url = 'https://cloud.iexapis.com/stable/stock'
        @url_2 = 'batch?types=quote,news,chart&range=1m&last=10&token=pk_64a3b816353a4d439a1ab35e94c99d32'
    end 

    def search_company_by_symbol(sym)
        req_url = "#{url}/#{sym}/#{url_2}"
        data = HTTParty.get(req_url)

        stock_hash = {
            symbol: data["quote"]["symbol"],
            companyName: data["quote"]["companyName"],
            close: data["quote"]["close"],
            volume: data["quote"]["volume"],
            peRatio: data["quote"]["peRatio"],
            marketCap: data["quote"]["marketCap"]
        }   
    
        stock = Stock.new(stock_hash) 
        stock
    end 
end
