module DomRiaParserGrigoriakMelenkoMorar
  require 'faker'
  require_relative './app_config_loader'
  require_relative './logger_manager'
  require_relative './rental_item'

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
    end
  end
end

DomRiaParserGrigoriakMelenkoMorar::Runner.run
