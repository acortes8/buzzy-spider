require "open-uri"
require "nokogiri"
require "pry"
require "json"
require_relative "ingredient_parser"

class Scraper
  def scrape_potential_urls
    sitemap = "https://www.liquor.com/sitemap_1.xml"
    xml = URI.open(sitemap)
    doc = Nokogiri::XML(xml)
    potential_urls = doc.css('url loc').map(&:text)
    
    potential_urls.reject! { |url| irrelevant_url?(url) }
    recipes = scrape_potential_recipes(potential_urls)
    write_to_json(recipes, "recipes.json")
  end

  def scrape_potential_recipes(potential_urls)
    recipes = []
    potential_urls.take(15).each do |url|
      html = URI.open(url)
      doc = Nokogiri::HTML(html)
      recipe_info = extract_recipe_info(doc)

      if recipe_info.nil?
        puts "Recipe information is incomplete. Skipping..."
      else
        recipes << recipe_info
        puts "Recipe information is complete. Appending..."
      end
    end
    recipes
  end

  private

  def irrelevant_url?(url)
    url.include?("/articles/") ||
    url.include?("/brands/") ||
    url.include?("/slideshows/") ||
    url.include?("best")
  end

  def extract_recipe_info(doc)
    name = doc.css("#heading_1-0 > h1").text.strip
    spirit_type = doc.css("#article-header-tag-nav_1-0 > a.breadcrumbs__item.breadcrumbs__item--3").text.strip
    description = extract_description(doc)
    ingredient_section = doc.css("#section--ingredients_1-0 p").map(&:text)
    ingredients = IngredientParser.parse_ingredient_section(ingredient_section)
    instructions = doc.css("#mntl-sc-block_3-0 p").map(&:text)

    return nil if name.empty? || spirit_type.empty? || description.empty? || ingredients.empty? || instructions.empty?

    { name: name, spirit_type: spirit_type, description: description, ingredients: ingredients, instructions: instructions }
  end

  def extract_description(doc)
    description = doc.css("#article__header--project_1-0 p").map(&:text)
    description.reject { |paragraph| paragraph.include?("Reprinted with permission") || paragraph.include?(" / ") }.join("\n")
  end

  def write_to_json(data, file)
    File.open(file, "w") do |file|
      file.write(JSON.pretty_generate(data))
    end
  end
end

scrape = Scraper.new
scrape.scrape_potential_urls