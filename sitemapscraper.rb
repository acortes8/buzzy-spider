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
        measurement_unit = [
            "milliliters",
            "teaspoon",
            "teaspoons",
            "tablespoon",
            "tablespoons",
            "ounce",
            "ounces",
            "cup",
            "cups",
            "pint",
            "pints",
            "quart",
            "quarts",
            "gallon",
            "gallons",
            "sprigs",
            "pieces",
            "whole",
            "dashes",
            "wedges",
            "stalks"
        ]

        potential_urls.each do |potential_url|
            url = potential_url
            html = URI.open(url)
            doc = Nokogiri::HTML(html)

            recipe_info = []

            c_name = doc.css("#heading_1-0 > h1")
            c_spirit_type = doc.css("#article-header-tag-nav_1-0 > a.breadcrumbs__item.breadcrumbs__item--3")
            c_description = doc.css("#article__header--project_1-0")
            ingredients_section = doc.css("#section--ingredients_1-0 > div")
            instructions_section = doc.css("#mntl-sc-block_3-0")

            if c_name.any? && c_spirit_type.any? && c_description.any? && ingredients_section.any? && instructions_section.any?
                puts "-------------------------------------------------------"
                puts c_name.text
                puts c_spirit_type.text
            
                paragraphs = c_description.css('p').map(&:text)
                filtered_paragraphs = paragraphs.reject do |paragraph|
                    paragraph.include?("Reprinted with permission") ||
                    paragraph.include?(" / ")
                end
                filtered_paragraphs.each { |paragraph| puts paragraph }

                #-------------------------ingredients parsing start--------------------------
                paragraphs = ingredients_section.css('p').map(&:text)
                paragraphs.each do |recipe|
                    name = ""
                    quantity = nil
                    unit = nil
                    description = nil
                  
                    if recipe.start_with?("Garnish:")
                      main_split = recipe.split(/,|\((.*)\)/, 2)
                      name_split = main_split[0]
                      desc_split = main_split[1]
                  
                      if name_split =~ /\d/
                        quantity = ""
                        sub_name_split = name_split.split
                  
                        sub_name_split.each do |element|
                          if element =~ /\d/
                            quantity << element
                            quantity << " "
                  
                          elsif element.include?("to")
                            quantity << element
                            quantity << " "
                  
                          else
                            name << element
                            name << " "
                  
                          end
                        end
                      else
                        name << name_split
                  
                      end
                      description = desc_split
                  
                    elsif recipe.include?("(1 bottle)")
                      main_split = recipe.split(/,|\((.*)/, 2)
                      name_split = main_split[0]
                      desc_split = main_split[1]
                      desc_split = desc_split.delete_prefix("1 bottle) ")
                      
                      if name_split =~ /\d/
                        quantity = ""
                        unit = ""
                        sub_name_split = name_split.split
                  
                        sub_name_split.each_with_index do |element, index|
                          if element =~ /\d/  && index <= 1
                            quantity << element
                            quantity << " "
                  
                          elsif measurement_unit.include?(element)
                            unit << element
                          else
                            name << element
                            name << " "
                  
                          end
                        end
                      else
                        name << name_split
                  
                      end
                      sub_desc_split = desc_split.split
                      name << sub_desc_split.first
                      name << " "
                      name << sub_desc_split.last
                      name = name&.sub(",", "")
                  
                    elsif recipe.include?(" plus ")
                      main_split = recipe.split("plus", 2)
                      name_split = main_split[0]
                      desc_split = main_split[1]
                      description = "plus "
                  
                      if name_split =~ /\d/
                        quantity = ""
                        unit = ""
                        sub_name_split = name_split.split
                  
                        sub_name_split.each_with_index do |element, index|
                          if element =~ /\d/  && index <= 1
                            quantity << element
                            quantity << " "
                  
                          elsif measurement_unit.include?(element)
                            unit << element
                  
                          else
                            name << element
                            name << " "
                  
                          end
                        end
                      else
                        name << name_split
                      end
                  
                      if desc_split =~ /\d/
                        sub_desc_split = desc_split.split
                  
                        sub_desc_split.each_with_index do |element, index|
                          if element =~ /\d/  && index <= 1
                            description << element
                            description << " "
                  
                          elsif measurement_unit.include?(element)
                            description << element
                  
                          else
                            name << element
                            name << " "
                  
                          end
                        end
                      else
                        name << name_split
                      end
                  
                    else
                      if recipe.include?("," || "(")
                        main_split = recipe.split(/,|\((.*)\)/, 2)
                        name_split = main_split[0]
                        desc_split = main_split[1]
                      elsif recipe.include?(" or ")
                        main_split = recipe.split("or", 2)
                        name_split = main_split[0]
                        desc_split = main_split[1]
                        desc_split.prepend("or")
                        if name_split.include?("fresh")
                          name_split = name_split.sub("fresh", "")
                        end
                        if name_split.split.last != desc_split.split.last
                          name_split << desc_split.split.last
                          desc_split = desc_split.sub(desc_split.split.last, "")
                        end
                      else
                        main_split = recipe.split(/,|\((.*)\)/, 2)
                        name_split = main_split[0]
                        desc_split = main_split[1]
                      end
                  
                      if name_split =~ /\d/
                        quantity = ""
                        unit = ""
                        sub_name_split = name_split.split
                  
                        sub_name_split.each_with_index do |element, index|
                          if element =~ /\d/  && index <= 1
                            quantity << element
                            quantity << " "
                  
                          elsif measurement_unit.include?(element)
                            unit << element
                  
                          else
                            name << element
                            name << " "
                  
                          end
                        end
                      else
                        name << name_split
                  
                      end
                      description = desc_split
                  
                    end
                  
                    recipe_info << {
                      name: name&.strip&.downcase,
                      quantity: quantity&.strip&.downcase,
                      unit: unit&.strip&.downcase,
                      description: description&.strip&.downcase
                    }
                end
                  
                recipe_info.each do |info|
                    puts "Name: #{info[:name]}"
                    puts "Quantity: #{info[:quantity]}"
                    puts "Unit: #{info[:unit]}"
                    puts "Description: #{info[:description]}"
                    puts "\n"
                end
                #-------------------------ingredients parsing start--------------------------
            
                paragraphs = instructions_section.css('p').map(&:text)
                paragraphs.each { |paragraph| puts paragraph }
                puts "-------------------------------------------------------"
            else
                puts "-------------------------------------------------------"
                puts "One or more elements are missing on the page."
                puts "-------------------------------------------------------"

            end
        end
    end
end

scrape = Scraper.new
scrape.scrape_potential_urls