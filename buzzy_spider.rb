require "httparty"
require "nokogiri"

response = HTTParty.get("https://www.liquor.com/stone-fruit-sour-cocktail-recipe-8412207")
html = response.body
    
#puts html

doc = Nokogiri::HTML(html)

CocktailRecipe = Struct.new(:c_name, :c_image, :c_spirit_type, :c_description, :c_instruction, :i_name, :i_description, :ci_quantity, :ci_unit, :ci_description)

html_article = doc.css("article")

cocktail_recipes = []

=begin
html_article.each do |html_article|
    c_name = doc.css("")
    c_image = doc.css("")
    c_spirit_type = doc.css("")
    c_description = doc.css("")
    c_instruction = doc.css("")
    i_name = doc.css("")
    i_description = doc.css("")
    ci_quantity = doc.css("")
    ci_unit = doc.css("")
    ci_description = doc.css("")

    cocktail_recipe = CocktailRecipe.new(c_name, c_image, c_spirit_type, c_description, c_instruction, i_name, i_description, ci_quantity, ci_unit, ci_description)

    cocktail_recipes.push(cocktail_recipe)
end
=end

puts html_article.css("h1").text
puts html_article.css("img")