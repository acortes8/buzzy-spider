require "open-uri"
require "nokogiri"
require "pry"

class Scraper
    def scrape_category_urls
        home_url = "https://www.liquor.com/cocktail-by-spirit-4779438"
        html = URI.open(home_url)
        doc = Nokogiri::HTML(html)

        categories = doc.css(".mntl-taxonomysc-child-block__links")
        binding.pry
    end
end

scrape = Scraper.new
scrape.scrape_category_urls