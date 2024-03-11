require "open-uri"
require "nokogiri"
require "pry"

class Scraper
    def scrape_category_urls
        home_url = "https://www.liquor.com/cocktail-by-spirit-4779438"
        html = URI.open(home_url)
        doc = Nokogiri::HTML(html)

        categories = doc.css(".mntl-taxonomysc-child-block__links").css('a')

        category_urls = []

        categories.each do |category|
            url = category.attribute('href').value
            category_urls << url
        end

        scrape_category_recipes(category_urls)
    end

    def scrape_category_recipes(category_urls)
        recipe_list = []
        
        category_urls.each do |category_url|
            url = category_url
            html = URI.open(url)
            doc = Nokogiri::HTML(html)
            binding.pry
        end
    end
end

scrape = Scraper.new
scrape.scrape_category_urls