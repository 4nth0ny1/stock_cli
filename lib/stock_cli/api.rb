require "httparty"
require "pry"

class Stock 

    attr_accessor :symbol, :companyName, :close, :volume, :peRatio, :marketCap

    @@all = []

    def initialize(hash)
        hash.each do |k, v|
            self.send("#{k}=", v)
        end 
        save
    end 

    def save 
        @@all << self
    end 

    def self.all 
        @@all 
    end 

end 

class Api

    attr_accessor :url, :url_2

    def initialize(url, url_2)
        @url = url
        @url_2 = url_2
    end 

    def search_company_by_symbol
        symbol = "aapl"
        req_url = "#{url}/#{symbol}/#{url_2}"
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
    end 
end

api = Api.new('https://cloud.iexapis.com/stable/stock', 'batch?types=quote,news,chart&range=1m&last=10&token=pk_64a3b816353a4d439a1ab35e94c99d32')
api.search_company_by_symbol
puts Stock.all

