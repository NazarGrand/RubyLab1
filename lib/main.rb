module DomRiaParserGrigoriakMelenkoMorar
    class Runner
      def self.run
        puts "Welcome to DomRiaParserGrigoriakMelenkoMorar!"
        Helper.say_hello
      end
    end
  
    class Helper
      def self.say_hello
        puts "Hello from DomRiaParserGrigoriakMelenkoMorar::Helper!"
      end
    end
  end
  
  DomRiaParserGrigoriakMelenkoMorar::Runner.run
  