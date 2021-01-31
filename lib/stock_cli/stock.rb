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