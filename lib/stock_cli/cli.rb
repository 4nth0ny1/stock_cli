class Cli 
    
    def call
        greeting 
        run 
    end 

    def greeting 
        puts ""
        puts "Welcome to Stock_cli"
    end 
    
    def run 
        stock_api = Api.new()

        puts ""
        print "Enter a stock symbol: "

        input = gets.strip.downcase
            s = stock_api.search_company_by_symbol(input)
            if s.is_a?(Stock)
                Stock.all.each do |s| 
                    puts ""
                    puts s.companyName 
                    print "Symbol: "
                    puts s.symbol
                    print "Price: $ "
                    puts s.close
                end
            else    
                puts "Invalid Entry. Try again"
                run
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
                    puts "Thanks for stopping by."
                    Kernel.exit!
                elsif second_input != "exit" ||second_input != "new stock" ||second_input != "yes"
                    puts "Invalid Entry. Try again"
                    run
                end
    end 

    
end 
