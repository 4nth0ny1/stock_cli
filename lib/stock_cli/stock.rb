require "pry"

class Stock 

    attr_reader :symbol, :companyName, :close, :volume, :peRatio, :marketCap, :primaryExchange, :week52High, :week52Low

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

    private 

    def symbol=(symbol)
        @symbol = symbol
    end 

    def companyName=(companyName)
        @companyName = companyName
    end 
     
    def close=(close)
        @close = close
    end
    
    def volume=(volume)
        @volume = volume
    end 

    def peRatio=(peRatio)
        @peRatio = peRatio
    end 

    def marketCap=(marketCap)
        @marketCap = marketCap
    end
    
    def primaryExchange=(primaryExchange)
        @primaryExchange = primaryExchange
    end

    def week52High=(week52High)
        @week52High = week52High
    end

    def week52Low=(week52Low)
        @week52Low = week52Low
    end

end 