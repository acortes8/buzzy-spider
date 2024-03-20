require "open-uri"
require "nokogiri"
require "pry"

class Scraper
    def scrape_potential_urls
        sitemap = "https://www.liquor.com/sitemap_1.xml"
        xml = URI.open(sitemap)
        doc = Nokogiri::XML(xml)

        potential_urls = doc.css('url loc').map(&:text) #4284 urls
        
        potential_urls.reject! do |url|
            url.include?("/articles/") || #removes 765
            url.include?("/brands/") || #removes 347
            url.include?("/slideshows/") || #removes 196
            url.include?("best") #removes 360
        end

        scrape_potential_recipes(potential_urls)
    end

    def scrape_potential_recipes(potential_urls)
        potential_urls.each do |potential_url|
            url = potential_url
            html = URI.open(url)
            doc = Nokogiri::HTML(html)

            c_name = doc.css("#heading_1-0 > h1")
            c_spirit_type = doc.css("#article-header-tag-nav_1-0 > a.breadcrumbs__item.breadcrumbs__item--3")
            c_description = doc.css("#article__header--project_1-0")
            ingredients_section = doc.css("#section--ingredients_1-0 > div")
            instructions_section = doc.css("#mntl-sc-block_3-0")

            if c_name.any? && c_spirit_type.any? && c_description.any? && ingredients_section.any? && instructions_section.any?
                #puts "-------------------------------------------------------"
                #puts c_name.text
                #puts c_spirit_type.text
            
                #paragraphs = c_description.css('p').map(&:text)
                #filtered_paragraphs = paragraphs.reject do |paragraph|
                    #paragraph.include?("Reprinted with permission") ||
                    #paragraph.include?(" / ")
                #end
                #filtered_paragraphs.each { |paragraph| puts paragraph }

                paragraphs = ingredients_section.css('p').map(&:text)
                paragraphs.each { |paragraph| puts paragraph }
                #puts "-------------------------------------------------------"
            
                #paragraphs = instructions_section.css('p').map(&:text)
                #paragraphs.each { |paragraph| puts paragraph }
            else
                #puts "One or more elements are missing on the page."
            end
        end
    end
end

scrape = Scraper.new
scrape.scrape_potential_urls