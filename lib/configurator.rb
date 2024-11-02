class Configurator
    attr_reader :config
  
    def initialize
      @config = {
        run_website_parser: 0,
        run_save_to_csv: 0,
        run_save_to_json: 0,
        run_save_to_yaml: 0,
        run_save_to_sqlite: 0,
        run_save_to_mongodb: 0
      }
    end
  
    def configure(overrides = {})
      overrides.each do |key, value|
        if @config.key?(key)
          @config[key] = value
        else
          puts "Warning: #{key} is not a valid configuration key."
        end
      end
    end
  
    def self.available_methods
      @config.keys
    end
  
    def run_actions(cart)
      if @config[:run_save_to_csv] == 1
        cart.save_to_csv
      end
      if @config[:run_save_to_json] == 1
        cart.save_to_json
      end
      if @config[:run_save_to_yaml] == 1
        cart.save_to_yml
      end
      if @config[:run_save_to_sqlite] == 1
        puts "Збереження даних у базу даних SQLite..."
      end
      if @config[:run_save_to_mongodb] == 1
        puts "Збереження даних у базу даних MongoDB..."
      end
    end
  end
  