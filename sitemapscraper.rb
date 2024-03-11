require "open-uri"
require "nokogiri"
require "pry"

class Scraper
    def scrape_category_urls
        sitemap_url = "https://www.liquor.com/sitemap_1.xml"
        xml = URI.open(sitemap_url)
        doc = Nokogiri::XML(xml)

        count = 0

        recipe_urls = doc.css('url loc').map(&:text)
        excluded_urls = File.readlines('excluded_urls.txt').map(&:chomp)
        
        recipe_urls.reject! do |url|
            url.include?("/articles/") ||
            url.include?("/brands/") ||
            url.include?("/slideshows/") ||
            url.include?("best") ||

            excluded_urls.any? { |excluded_url| url.include?(excluded_url) }
        end

        recipe_urls.each do |url|
            puts url
            count += 1
        end

        puts count

    end
end

scrape = Scraper.new
scrape.scrape_category_urls