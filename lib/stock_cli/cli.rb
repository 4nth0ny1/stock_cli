class Cli 

    def call
        greeting 
        run 
    end 

    def greeting 
        puts ""
        puts "Welcome to Stock_cli"
    end 

    def basic_info(s, input)
        if s.is_a?(Stock)
            puts ""
            puts s.companyName 
            print "Symbol: "
            puts s.symbol
            print "Closing Price: $"
            puts s.close 
            print "Latest Price: $"
            puts s.latestPrice
            print "Primary Exchange: "
            puts s.primaryExchange.capitalize
        elsif input == "quit"
            puts ""
            puts "Thanks for stopping by."
            puts ""
            Kernel.exit!
        else  
            puts ""  
            puts "Invalid Entry. Try again"
            run
        end
    end 

    def more_info(second_input, s)
        if second_input == "yes"

            ## financials
            puts ""
            print "Market Cap: "
            puts s.marketCap
            print "Volume: "
            puts s.volume
            print "Avg Volume: "
            puts s.avgTotalVolume
            print "P/E Ratio: "
            puts s.peRatio
            print "52-Week High: "
            puts s.week52High
            print "52-Week Low: "
            puts s.week52Low
            
            ##news 
            puts ""
            puts "News"
            print "Latest Headline: "
            puts s.headline
            print "Source: "
            puts s.source
            print "Summary: "
            puts s.summary
            print "URL: "
            puts s.url

            run
        elsif second_input == "new stock"
            run
        elsif second_input == "quit"
            puts ""
            puts "Thanks for stopping by."
            puts ""
            Kernel.exit!
        elsif second_input != "quit" ||second_input != "new stock" ||second_input != "yes"
            puts "Invalid Entry. Try again"
            run
        end
    end

    def portfolio
        Stock.all.each do |s|
           puts "#{s.companyName} - #{s.latestPrice} - #{s.peRatio} - #{s.avgTotalVolume}"
        end 
    end 

    def run 
        stock_api = Api.new()
        puts ""
        print "Enter a stock symbol: "
        input = gets.strip.downcase
        s = stock_api.search_company_by_symbol(input)
        basic_info(s, input)
        puts ""
        puts "Portfolio"
        portfolio
        puts ""
        puts "Type 'yes' for more information."
        puts "Type 'new stock' to choose another stock."
        puts "Type 'quit' to exit the program."
        puts ""
        second_input = gets.strip.downcase
        more_info(second_input, s)
    end 
end 




