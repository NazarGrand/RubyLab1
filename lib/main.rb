module DomRiaParserGrigoriakMelenkoMorar
  require_relative './app_config_loader'
  require_relative './logger_manager'

  class Runner
    def self.run
      app_config_loader = AppConfigLoader.new
      app_config_loader.load_libs

      config_data = app_config_loader.config('config/default_config.yaml', 'config')
      logging_config = config_data['logging']

      LoggerManager.init_logger(logging_config)
      LoggerManager.log_processed_file("Application started")

      puts "Configuration loaded: #{JSON.pretty_generate(config_data)}"
    end
  end
end

DomRiaParserGrigoriakMelenkoMorar::Runner.run
