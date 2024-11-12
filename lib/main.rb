module DomRiaParserGrigoriakMelenkoMorar
    require 'faker'
    require_relative './app_config_loader'
    require_relative './logger_manager'
    require_relative './rental_item'
    require_relative './cart'
    require_relative './configurator'
    require_relative './simple_website_parser'
    require_relative './engine'
  
    class Runner
      def self.run
        app_config_loader = AppConfigLoader.new
        app_config_loader.load_libs
  
        config_data = app_config_loader.config('config/default_config.yaml', 'config')
        logging_config = config_data['logging']

        LoggerManager.init_logger(logging_config)
        LoggerManager.log_processed_file("Application started")

        configurator = Configurator.new
  
        configurator.configure(
          run_website_parser: 1,
          run_save_to_csv: 1,
          run_save_to_json: 1,
          run_save_to_yaml: 1,
          run_save_to_mongodb: 1
        )        
  
        # puts "Items with price > 10000:"
        # cart.select { |item| item.price > 10000 }.each { |item| puts item.info }
  
        # puts "\nSorted items by price:"
        # cart.sort.each { |item| puts item.info }
  
        # total_price = cart.reduce(0) { |sum, item| sum + item.price }
        # puts "\nTotal price of all items: #{total_price} грн"
  
        # puts "\nSaving items to files..."
        # cart.save_to_file

        engine = Engine.new(config_data, configurator)
        engine.run()
      end
    end
  end
  
  DomRiaParserGrigoriakMelenkoMorar::Runner.run
  