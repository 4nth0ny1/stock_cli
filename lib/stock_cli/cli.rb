class Cli 

    def run 
        puts ""
        puts "Welcome to your stock check cli"
        puts ""
        stock_api = Api.new()
        print "Enter a stock symbol: "
        input = gets.strip.downcase
        stock_api.search_company_by_symbol(input)
        Stock.all.each do |s| 
            puts ""
            puts s.companyName 
            print "Symbol: "
            puts s.symbol
            print "Price: $ "
            puts s.close
        end
        puts ""
        puts "Type 'yes' for more information."
        puts "Type 'new stock' to choose another stock."
        puts "Type 'exit' to exit the program."
        puts ""
        second_input = gets.strip.downcase
        if second_input == "yes"
            Stock.all.each do |s|
                puts ""
                print "Market Cap: "
                puts s.marketCap
                print "Volume: "
                puts s.volume
                print "P/E Ratio: "
                puts s.peRatio
                run
            end 
        elsif second_input == "new stock"
            run
        elsif second_input == "exit"
            puts "see ya later"
        end
    end 
end 
