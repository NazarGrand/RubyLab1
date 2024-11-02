require 'mechanize'
require 'yaml'
require 'logger'
require 'fileutils'
require 'thread'

class SimpleWebsiteParser
    attr_accessor :config, :agent, :item_collection

    def initialize(config_file)
      @config = YAML.load_file(config_file)
      @agent = Mechanize.new
      @item_collection = []
      @logger = LoggerManager.new
    end

    def start_parse
    end

    def extract_products_links(page)
    end

    def parse_product_page(product_link)
    end

    def extract_product_name(product)
    end

    def extract_product_price(product)
    end

    def extract_product_description(product)
    end

    def extract_product_image(product)
    end

    def check_url_response(url)
    end

    def save_product_image(image_url, product_name)
    end
end