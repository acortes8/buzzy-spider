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
  "2 ounces rye whiskey",
  "1/2 ounce dry vermouth",
  "1/2 ounce Benedictine",
  "1/4 ounce prune brandy",
  "2 dashes Angostura bitter",
  "2 dashes orange bitters",
  "2 ounces gin",
  "1 ounce lemon juice, freshly squeezed",
  "3/4 ounce simple syrup",
  "1 egg white (about 1/2 ounce)",
  "Club soda, to top (about 1 ounce)",
  "2 ounces vodka",
  "1/2 ounce coffee liqueur (usually Kahlúa)",
  "1 ounce espresso, freshly brewed (or cold brew concentrate)",
  "1/4 ounce simple syrup",
  "1 1/2 ounces 100 proof rye whiskey",
  "1 ounce dry vermouth",
  "1 ounce Ramazzotti",
  "1 dash orange bitters",
  "2 ounces rye whiskey",
  "1 ounce sweet vermouth",
  "2 dashes Angostura bitters",
  "2 drops orange bitters",
  "1 ounce brut Champagne",
  "3/4 ounce creme de noyaux",
  "3/4 ounce white creme de cacao",
  "1 1/2 ounces heavy cream",
  "1 1/2 ounces cognac",
  "1 ounce dark creme de cacao",
  "1 ounce cream",
  "2 ounces vodka",
  "1 ounce Kahlúa",
  "1 ounce heavy cream",
  "1 ounce Banks 5 Island Rum",
  "1 ounce Cruzan Black Strap Rum",
  "3/4 ounce lime juice, freshly squeezed",
  "3/4 ounce simple syrup",
  "1 1/2 ounces vodka",
  "1/2 ounce lemon juice, freshly squeezed",
  "3/4 ounce lavender and dry spice syrup (recipe below)",
  "3/4 ounce ginger tea (recipe below)",
  "1 3/4 ounces bourbon",
  "3/4 ounce dark amaro, like Averna or Ramazzotti",
  "1/4 ounce Strega",
  "2 dashes Peychaud's bitters",
  "1 1/2 ounces reposado tequila, like Tequila Altos Reposado",
  "1/2 ounce viche",
  "1/2 ounce vanilla liqueur",
  "1 ounce lulo puree",
  "1/2 ounce lemon juice, freshly squeezed",
  "1/2 ounce orange juice, freshly squeezed",
  "4-5 whole fall squash, peeled, de-seeded and shredded (approx. 5 quarts by volume)",
  "2-4 pieces fresh ginger, about 2 1/2 inches x 1 inch, peeled and shredded",
  "3 quarts maple syrup",
  "2 cups water",
  "2 tablespoons juniper or peppercorn",
  "Garnish: Imperial-grade matcha",
  "Garnish: maraschino cherry",
  "Garnish: orange twist",
  "Garnish: coffee beans",
  "Garnish: orange twist",
  "Garnish: mint sprig",
  "Garnish: orange wheel",
  "Garnish: orange peel",
  "Garnish: lime wheel",
  "Garnish: lime wheel",
  "Garnish: fresh lavender sprig (optional)",
  "Garnish: cinnamon sticks (1 per storage bottle and 2 per individual serving)",
  "Garnish: 1/2 passion fruit, fresh",
  "Garnish: 2 green olives",
  "Garnish: grated nutmeg",
  "Garnish: nutmeg, freshly grated",
  "Garnish: star anise, freshly grated",
  "Garnish: brandied cherry (or lemon twist, if preferred)",
  "Garnish: 2 to 4 olives, fresh",
  "4 sprigs mint, including stems and leaves",
  "5 cups apple cider vinegar",
  "Soda water, to top",
  "1 egg white",
  "3/4 ounce heavy cream",
  "3/4 ounce lime stock, or lime juice, freshly squeezed",
  "1/2 ounce rich simple syrup, 1.5:1 ratio (instructions below)",
  "1/2 ounce Midori",
  "1 3/4 ounces rice-washed Wonderbird Gin No. 61 (instructions below)",
  "Soda water, preferably Topo Chico, to top",
  "56 ounces sweetened condensed milk",
  "48 ounces evaporated milk",
  "24 ounces cream of coconut (such as Coco Lopez)",
  "4 teaspoons vanilla extract",
  "4 teaspoons ground cinnamon",
  "1 teaspoon ground nutmeg",
  "750 milliliters (1 bottle) white, añejo or spiced Puerto Rican rum"
]

recipe_info = []

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
  "dashes"
]

recipes.each do |recipe|
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

  else
    main_split = recipe.split(/,|\((.*)\)/, 2)
    name_split = main_split[0]
    desc_split = main_split[1]

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

  #description = description&.sub(")", "")

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