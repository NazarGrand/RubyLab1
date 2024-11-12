require_relative './cart'
require_relative './archive_creater'

class Engine
    def initialize(config_data, configurator)
        @config_data = config_data
        @configurator = configurator
      end

    def run()
        unless @config_data
          puts "Configuration not loaded. Exiting..."
          return
        end

        cart = Cart.new(@config_data['output_dir'])

        webparsing_config = @config_data['web_scraping']
        mongodb_config = @config_data['mongodb']

        @configurator.run_actions(cart, webparsing_config, mongodb_config)

        archive_path = 'output/archive.zip'
        ArchiveCreator.new('output', archive_path).create_zip
    end
end