require "httparty"
require "nokogiri"

response = HTTParty.get("https://www.liquor.com/claret-cup-8580464")
html = response.body
    
#puts html

doc = Nokogiri::HTML(html)

CocktailRecipe = Struct.new(:c_name, :c_image, :c_spirit_type, :c_description, :c_instruction, :i_name, :i_description, :ci_quantity, :ci_unit, :ci_description)

html_article = doc.css("article")

cocktail_recipes = []

=begin
html_article.each do |html_article|
    done c_name = doc.css("")
    c_image = doc.css("")
    done c_spirit_type = doc.css("")
    done c_description = doc.css("")
    done c_instruction = doc.css("")
    done i_name = doc.css("")
    done i_description = doc.css("")
    done ci_quantity = doc.css("")
    done ci_unit = doc.css("")
    done ci_description = doc.css("")

    cocktail_recipe = CocktailRecipe.new(c_name, c_image, c_spirit_type, c_description, c_instruction, i_name, i_description, ci_quantity, ci_unit, ci_description)

    cocktail_recipes.push(cocktail_recipe)
end
=end

puts html_article.css("#heading_1-0 > h1").text

puts html_article.css("#article-header-tag-nav_1-0 > a.breadcrumbs__item.breadcrumbs__item--3").text

selected_element = html_article.css("#article__header--project_1-0")
paragraphs = selected_element.css('p').map(&:text)
filtered_paragraphs = paragraphs.reject { |paragraph| paragraph.include?('<em>') }
filtered_paragraphs.each do |paragraph|
    puts paragraph
end
puts html_article.css("#article__header--project_1-0")

selected_element = html_article.css("#section--ingredients_1-0 > div")
paragraphs = selected_element.css('p').map(&:text)
paragraphs.each do |paragraph|
    puts paragraph
end

selected_element = html_article.css("#mntl-sc-block_3-0")
paragraphs = selected_element.css('p').map(&:text)
paragraphs.each do |paragraph|
    puts paragraph
end