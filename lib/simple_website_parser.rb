require 'nokogiri'
require 'open-uri'
require 'logger'

class SimpleWebsiteParser
  def initialize(config)
    @config = config
    @logger = Logger.new(STDOUT)
    @logger.level = Logger::INFO
  end

  def start_parse
    puts "Parsing website..."
    puts "Configuration: #{@config}"

    start_page = @config['start_page']
    product_selector = @config['product_selector']
    product_name_selector = @config['product_name_selector']
    product_price_selector = @config['product_price_selector']
    product_description_selector = @config['product_description_selector']
    product_image_selector = @config['product_image_selector']
    product_rooms_selector = @config['product_rooms_selector']
    product_location_selector = @config['product_location_selector']
    

    # Open the webpage using Nokogiri and OpenURI
    doc = Nokogiri::HTML(URI.open(start_page))

    # Find products (adjust according to your needs)
    products = doc.css(product_selector)

    # Parse product information
    products.each do |product|
      product_name = product.at_css(product_name_selector).text.strip rescue nil
      product_price = product.at_css(product_price_selector).text.strip rescue nil
      product_description = product.at_css(product_description_selector).text.strip rescue nil
      product_image = product.at_css(product_image_selector)['href'] rescue nil
      product_rooms = product.at_css(product_rooms_selector).text.strip rescue nil
      product_location = product.at_css(product_location_selector).text.strip rescue nil

      # Log the parsed product details
      @logger.info("Parsed product: #{product_name}")
      @logger.info("Price: #{product_price}")
      @logger.info("Description: #{product_description}")
      @logger.info("Image URL: #{product_image}")
      @logger.info("Rooms/Area: #{product_rooms}")
      @logger.info("Location: #{product_location}")
      @logger.info("------------------------------------------")

      # Optionally print to the console
      puts "Name: #{product_name}"
      puts "Price: #{product_price}"
      puts "Description: #{product_description}"
      puts "Image URL: #{product_image}"
      puts "Rooms/Area: #{product_rooms}"
      puts "Location: #{product_location}"
      puts "------------------------------------------"
    end
  end
end
