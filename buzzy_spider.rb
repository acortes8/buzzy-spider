require "open-uri"
require "nokogiri"
require "pry"

    
#puts html


#CocktailRecipe = Struct.new(:c_name, :c_image, :c_spirit_type, :c_description, :c_instruction, :i_name, :i_description, :ci_quantity, :ci_unit, :ci_description)

#cocktail_recipes = []

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

url = "https://www.liquor.com/recipes/bloody-bulldog/"
html = URI.open(url)
doc = Nokogiri::HTML(html)

c_name = doc.css("#heading_1-0 > h1")
c_spirit_type = doc.css("#article-header-tag-nav_1-0 > a.breadcrumbs__item.breadcrumbs__item--3")
c_description = doc.css("#article__header--project_1-0")
ingredients_section = doc.css("#section--ingredients_1-0 > div")
instructions_section = doc.css("#mntl-sc-block_3-0")

if c_name.any? && c_spirit_type.any? && c_description.any? && ingredients_section.any? && instructions_section.any?
    puts c_name.text
    #puts c_spirit_type.text

    paragraphs = c_description.css('p').map(&:text)
    filtered_paragraphs = paragraphs.reject do |paragraph|
        paragraph.include?("Reprinted with permission") ||
        paragraph.include?(" / ")
    end
    filtered_paragraphs.each { |paragraph| puts paragraph }

    #paragraphs = ingredients_section.css('p').map(&:text)
    #paragraphs.each { |paragraph| puts paragraph }

    #paragraphs = instructions_section.css('p').map(&:text)
    #paragraphs.each { |paragraph| puts paragraph }
else
    puts "One or more elements are missing on the page."
end

recipes = [
  "Peels of 5 whole lemons",
  "Peels of 1 orange",
  "Peels of 2 whole grapefruits",
  "1 whole pineapple, diced with skins",
  "1 pound granulated sugar",
  "1/8 teaspoon nutmeg, freshly grated",
  "1/4 teaspoon coriander seeds",
  "1 pod star anise",
  "4 pods green cardamom, roasted",
  "6 allspice berries, whole",
  "1/8 teaspoon cloves, whole",
  "16 ounces Lifted Spirits Jalapeño and Herb Vodka",
  "16 ounces Cleveland Wheat Penny 1958 Bourbon",
  "8 ounces Heirloom Pineapple Amaro",
  "8 ounces Geijer California Fernet",
  "6 ounces lemon juice, freshly squeezed",
  "4 ounces pastis",
  "1 quart oversteeped passion fruit green tea (instructions below)",
  "1 1/4 quarts whole milk",
  "Garnish: sweet pepper (optional)",
  "Garnish: carnation flower (optional)"
]

recipe_info = []

recipes.each do |recipe|
  match = recipe.match(/^(?<quantity>[\d\s\/]+)?\s*(?<unit>\w+)?\s*(?<name>.+)$/)

  if match
    quantity = match[:quantity]
    unit = match[:unit]
    name = match[:name]

    # If quantity is present and includes a '/', handle fractions
    if quantity && quantity.include?('/')
      numerator, denominator = quantity.split('/').map(&:to_i)
      quantity = numerator.to_f / denominator
    else
      quantity = quantity.to_i if quantity
    end

    recipe_info << {
      name: name,
      quantity: quantity,
      unit: unit,
      description: recipe
    }
  else
    # If the regular expression doesn't match, consider it as just a name/description
    recipe_info << {
      name: recipe,
      quantity: nil,
      unit: nil,
      description: recipe
    }
  end
end

# Print the parsed information
recipe_info.each do |info|
  puts "Name: #{info[:name]}"
  puts "Quantity: #{info[:quantity]}"
  puts "Unit: #{info[:unit]}"
  puts "Description: #{info[:description]}"
  puts "\n"
end