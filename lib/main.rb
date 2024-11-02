module DomRiaParserGrigoriakMelenkoMorar
  require 'faker'
  require_relative './app_config_loader'
  require_relative './logger_manager'
  require_relative './rental_item'
  require_relative './cart'

  class Runner
    def self.run
      app_config_loader = AppConfigLoader.new
      app_config_loader.load_libs

      config_data = app_config_loader.config('config/default_config.yaml', 'config')
      logging_config = config_data['logging']

      LoggerManager.init_logger(logging_config)
      LoggerManager.log_processed_file("Application started")

      puts "Configuration loaded: #{JSON.pretty_generate(config_data)}"

      rental_item = RentalItem.generate_fake
      LoggerManager.log_processed_file("Створено об'єкт RentalItem: #{rental_item.info}")
      puts rental_item.info

      cart = Cart.new(config_data['output_dir'])
      cart.generate_test_items(10)

      puts "Items with price > 10000:"
      cart.select { |item| item.price > 10000 }.each { |item| puts item.info }

      puts "\nSorted items by price:"
      cart.sort.each { |item| puts item.info }

      total_price = cart.reduce(0) { |sum, item| sum + item.price }
      puts "\nTotal price of all items: #{total_price} грн"

      puts "\nSaving items to files..."
      cart.save_to_file
      cart.save_to_json
      cart.save_to_csv
      cart.save_to_yml
    end
  end
end

DomRiaParserGrigoriakMelenkoMorar::Runner.run
