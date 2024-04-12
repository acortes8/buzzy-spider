
require "pry"

ingredient_section = [
  "1 quart tomato juice or Campbell’s V8 juice",
  "1 teaspoon celery salt",
  "3/4 ounce worcestershire sauce",
  "4 ounces fresh lime or lemon juice",
  "1 1/2 teaspoons hot pepper sauce, or to taste",
  "8 ounces light or dark rum",
  "1 tablespoon granulated sugar",
  "1 ounce warm water",
  "3 oranges, sliced",
  "2 lemons, sliced",
  "1 pineapple, peeled, cored, and sliced into rings",
  "1 ounce Abricotine or apricot brandy",
  "2 ounces Curaçao or tangerine liqueur",
  "2 cups sparkling water",
  "1 grapefruit, thinly sliced and cut into half-moons",
  "1/2 ounce fresh lemon juice",
  "1–1 1/2 ounces gin",
  "Garnish: fresh mint leaf",
  "1 1/2 ounces gin, preferably Old Tom",
  "1 ounce sweet vermouth",
  "1/2 ounce lime juice, freshly squeezed",
  "1/4 ounce maraschino liqueur",
  "Garnish: maraschino cherry",
  "1 1/4 ounces vodka, like J. Rieger’s Premium Wheat Vodka",
  "3/4 ounce riesling, preferably the kabinett style",
  "1/2 ounce chamomile syrup (ingredient follows)",
  "3/4 ounce lime juice, freshly squeezed",
  "2 ounces sparkling mineral water, like Topo Chico or Jarritos Mineragua",
  "Garnish: lime wheel",
  "2 ounces cognac",
  "3/4 ounce lemon juice, freshly squeezed",
  "1/2 ounce Green Chartreuse",
  "1/4 ounce simple syrup",
  "2 dashes Angostura bitters",
  "Garnish: lemon twist",
  "2 ounces rye whiskey",
  "3/4 ounce sweet vermouth",
  "1/4 ounce maraschino liqueur",
  "1/4 ounce Amer Picon (or Amaro Lucano)",
  "1 1/2 ounces reposado tequila, like Tequila Komos Reposado Rosa",
  "3/4 ounce salted lychee cordial (ingredient below)",
  "1/2 ounces manzanilla sherry",
  "1/2 ounces elderflower liqueur, like St-Germain",
  "1/2 ounces lime juice, freshly squeezed",
  "Garnish: edible flower petals (optional)",
  "1 ounce gin",
  "1/2 ounce lemon juice, freshly squeezed",
  "1/2 ounce simple syrup",
  "3 ounces Champagne (or other sparkling wine)",
  "Garnish: lemon twist",
  "2 ounces gin",
  "1/2 ounce lime juice, freshly squeezed",
  "Club soda, to top",
  "Garnish: lime wheels",
  "1 1/2 ounces El Tesoro Blanco Tequila",
  "1/2 ounce Naranja Licor de Naranja",
  "1/2 ounce lemon juice, freshly squeezed",
  "1/2 ounce lime juice, freshly squeezed",
  "1/2 ounce agave syrup",
  "1/2 ounce Grand Marnier, to float",
  "Garnish: salt rim",
  "2 ounces Fords Gin",
  "1 ounce Lustau rosé vermouth ",
  "1 ounce Tio Pepe sherry",
  "1/4 ounce Amaro Santoni",
  "Garnish: purple olive",
  "Garnish: lemon peel, expressed and discarded",
  "Garnish: orange peel, expressed and discarded",
  "1/4 cup mace",
  "15 allspice berries",
  "1 teaspoon whole cloves",
  "1 teaspoon cinnamon, freshly grated",
  "16 ounces heavy cream",
  "4 large eggs",
  "6 ounces sugar",
  "24 ounces India pale ale",
  "8 ounces porter",
  "3 ounces Strega liqueur",
  "1 ounce allspice dram",
  "1 ounce Velvet Falernum",
  "Garnish: grated nutmeg",
  "56 ounces sweetened condensed milk",
  "48 ounces evaporated milk",
  "24 ounces cream of coconut (such as Coco Lopez)",
  "4 teaspoons vanilla extract",
  "4 teaspoons ground cinnamon",
  "1 teaspoon ground nutmeg",
  "750 milliliters (1 bottle) white, añejo or spiced Puerto Rican rum",
  "Garnish: cinnamon sticks (1 per storage bottle and 2 per individual serving)",
  "Boiling water, to rinse",
  "1 ounce dark rum",
  "1 ounce cognac",
  "1 tablespoon Tom & Jerry batter (ingredient below)",
  "Whole milk, hot, to top",
  "Garnish: nutmeg, freshly grated",
  "Garnish: ground cloves",
  "Garnish: ground allspice",
  "1 egg white",
  "3/4 ounce heavy cream",
  "3/4 ounce lime stock, or lime juice, freshly squeezed",
  "1/2 ounce rich simple syrup, 1.5:1 ratio (instructions below)",
  "1/2 ounce Midori",
  "1 3/4 ounces rice-washed Wonderbird Gin No. 61 (instructions below) ",
  "Soda water, preferably Topo Chico, to top",
  "Garnish: Imperial-grade matcha",
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
  "Garnish: carnation flower (optional)",
  "4–5 whole fall squash, peeled, de-seeded and shredded (approx. 5 quarts by volume)",
  "2–4 pieces fresh ginger, about 2 1/2 inches x 1 inch, peeled and shredded",
  "3 quarts maple syrup",
  "2 cups water",
  "2 tablespoons juniper or peppercorn",
  "4 sprigs mint, including stems and leaves",
  "5 cups apple cider vinegar",
  "Soda water, to top",
  "Garnish: mint sprig",
  "2 ounces mezcal, like Del Maguey Vida Clásico",
  "3/4 ounce orange juice, freshly squeezed",
  "3/4 ounce pickling brine",
  "1/2 ounce simple syrup",
  "1/2 ounce lime juice, freshly squeezed",
  "6 dashes  habanero bitters",
  "2 ounces Mexican lager, like Modelo Especial",
  "Garnish: orange twist",
  "1 barspoon Yellow Chartreuse",
  "1/4 ounce agave caramel (ingredient below)",
  "3/4 ounce vin jaune",
  "2 ounces reposado tequila",
  "Garnish: lemon twist, expressed and discarded",
  "Garnish: honeycomb (optional)",
  "1 1/2 ounces bonded bourbon, preferably Evan Williams Bottled-in-Bond",
  "3/4 ounce lemon juice, freshly squeezed",
  "3/4 ounce rich simple syrup",
  "1 barspoon apricot brandy",
  "1/2 ounce egg white",
  "1 1/2 ounces reposado tequila, like Tequila Altos Reposado",
  "1/2 ounce viche",
  "1/2 ounce vanilla liqueur",
  "1 ounce lulo puree",
  "1/2 ounce lemon juice, freshly squeezed",
  "1/2 ounce orange juice, freshly squeezed",
  "Garnish: orange wheel",
  "1 3/4 ounces bourbon",
  "3/4 ounce dark amaro, like Averna or Ramazzotti",
  "1/4 ounce Strega",
  "2 dashes Peychaud’s bitters",
  "Garnish: orange peel",
  "1 1/2 ounces vodka",
  "1/2 ounce lemon juice, freshly squeezed",
  "3/4 ounce lavender and dry spice syrup (ingredient below)",
  "3/4 ounce ginger tea (ingredient below)",
  "Garnish: lime wheel",
  "Garnish: fresh lavender sprig (optional)",
  "2 ounces vodka",
  "1 ounce Kahlúa",
  "1 ounce Banks 5 Island Rum",
  "1 ounce Cruzan Black Strap Rum",
  "3/4 ounce lime juice, freshly squeezed",
  "3/4 ounce simple syrup",
  "Garnish: lime wheel",
  "2 ounces vodka",
  "1 ounce Kahlúa",
  "1 ounce heavy cream",
  "1 1/2 ounces cognac",
  "1 ounce dark creme de cacao",
  "1 ounce cream",
  "Garnish: grated nutmeg",
  "3/4 ounce creme de noyaux",
  "3/4 ounce white creme de cacao",
  "1 1/2 ounces heavy cream",
  "Garnish: freshly grated nutmeg",
  "2 ounces rye whiskey",
  "1 ounce sweet vermouth",
  "2 dashes Angostura bitters",
  "2 drops orange bitters",
  "1 ounce brut Champagne",
  "Garnish: maraschino cherry",
  "1 1/2 ounces 100 proof rye whiskey",
  "1 ounce dry vermouth",
  "1 ounce Ramazzotti",
  "1 dash orange bitters",
  "Garnish: orange twist",
  "2 ounces vodka",
  "1/2 ounce coffee liqueur (usually Kahlúa)",
  "1 ounce espresso, freshly brewed (or cold brew concentrate)",
  "1/4 ounce simple syrup",
  "Garnish: coffee beans",
  "2 ounces gin",
  "1 ounce lemon juice, freshly squeezed",
  "3/4 ounce simple syrup",
  "1 egg white (about 1/2 ounce)",
  "Club soda, to top (about 1 ounce)",
  "2 ounces rye whiskey",
  "1/2 ounce dry vermouth",
  "1/2 ounce Benedictine",
  "1/4 ounce prune brandy",
  "2 dashes Angostura bitter",
  "2 dashes orange bitters",
  "Garnish: orange twist",
  "1/3 ounce coffee liqueur",
  "1/3 ounce Baileys Irish cream liqueur",
  "1/3 ounce Grand Marnier liqueur",
  "1 1/2 ounces whiskey",
  "4 ounces ginger beer",
  "4 dashes Angostura bitters",
  "1 lemon wedge",
  "2 ounces bourbon or rye whiskey",
  "3/4 ounce sweet vermouth",
  "1/4 ounce Fernet-Branca",
  "2 ounces blended Scotch whisky",
  "3/4 ounce lemon juice",
  "1/2 ounce simple syrup",
  "2 dashes Angostura bitters",
  "1 egg white",
  "Garnish: orange twist",
  "1 1/2 ounces rye whiskey",
  "3/4 ounce dry vermouth",
  "3/4 ounce pineapple juice",
  "Garnish: pineapple wedge",
  "Garnish: maraschino cherry",
  "3 ounces Jell-O or other flavored gelatin",
  "8 ounces boiling water",
  "4 ounces vodka or white rum",
  "4 ounces cold water",
  "2 ounces scotch",
  "3/4 ounce sweet vermouth",
  "3 dashes Angostura bitters",
  "Garnish: brandied cherries",
  "1 1/2 ounces amaretto liqueur",
  "3/4 ounce cask-proof bourbon",
  "1 ounce lemon juice, freshly squeezed",
  "1 teaspoon rich simple syrup",
  "1/2 ounce egg white",
  "Garnish: lemon twist",
  "Garnish: 2 brandied cherries",
  "2 1/2 ounces gin or vodka",
  "1/2 ounce dry vermouth",
  "1/2 ounce olive brine",
  "Garnish: 2 to 4 olives",
  "1 1/2 ounces vodka or gin",
  "Grapefruit juice, freshly squeezed, to top",
  "Garnish: lime wheel",
  "1 teaspoon sugar",
  "3 dashes Angostura bitters",
  "1 teaspoon water",
  "2 ounces bourbon (or rye whiskey, if preferred)",
  "Garnish: orange twist",
  "2 ounces vodka",
  "1/2 ounce lime juice, freshly squeezed",
  "3 ounces ginger beer, chilled",
  "Garnish: lime wheel",
  "2 ounces rye whiskey",
  "1 ounce sweet vermouth",
  "2 dashes Angostura bitters",
  "Garnish: brandied cherry (or lemon twist, if preferred)",
  "2 ounces blended scotch or bourbon",
  "1/4 ounce amaretto",
  "1 ounce bourbon",
  "1 ounce apple brandy",
  "1 ounce fresh apple juice",
  "1/2 ounce apple cider vinegar",
  "2 dashes Fee Brothers Black Walnut Bitters",
  "Garnish: apple slice",
  "Garnish: cinnamon, freshly grated",
  "Garnish: star anise, freshly grated",
  "2 ounces gin",
  "3/4 ounce lemon juice, freshly squeezed",
  "1/2 ounce honey syrup",
  "Garnish: lemon twist",
  "1 1/2 ounces scotch",
  "3/4 ounce Drambuie",
  "Absinthe, to rinse",
  "3/4 ounce London dry gin",
  "3/4 ounce Lillet blanc",
  "3/4 ounce orange liqueur",
  "3/4 ounce lemon juice, freshly squeezed",
  "2 ounces tequila",
  "1/2 ounce lime juice, freshly squeezed",
  "4 ounces Grapefruit soda, chilled, to top",
  "Pinch of salt",
  "Garnish: lime wheel",
  "1 ounce vodka",
  "1 ounce coffee liqueur",
  "1 ounce Baileys Irish cream",
  "1 1/2 ounces heavy cream",
  "Garnish: chocolate shavings",
  "2 ounces Goslings Black Seal rum",
  "1/2 ounce lime juice, freshly squeezed",
  "Ginger beer, to top (about 5 ounces)",
  "Garnish: lime wheel",
  "1 1/2 ounces cachaça",
  "3/4 ounce simple syrup",
  "1/2 ounce sherry",
  "1/4 ounce lime juice",
  "1 ounce coconut milk",
  "3 dashes bitters",
  "1 pinch salt",
  "Garnish: lime twist",
  "2 ounces aged rum, preferably Mount Gay",
  "1 barspoon apple cider syrup (ingredient below)",
  "3 dashes Angostura bitters",
  "Garnish: orange twist",
  "1 1/2 ounces vodka",
  "Orange juice, freshly squeezed, to top",
  "2 ounces London dry gin",
  "1 ounce lemon juice, freshly squeezed",
  "1/2 ounce simple syrup",
  "Club soda, to top",
  "Garnish: lemon wheel",
  "Garnish: maraschino cherry",
  "1 ounce cognac",
  "1 ounce rye whiskey",
  "1/2 ounce Strega",
  "1/4 ounce Luxardo Amaro Abano",
  "1/4 ounce orgeat",
  "Garnish: orange twist",
  "Garnish: lemon twist",
  "1 1/2 ounces St-Germain elderflower liqueur",
  "2 ounces dry white wine or Champagne",
  "2 ounces club soda",
  " Garnish: lemon twist",
  "1 ounce Midori",
  "1/2 ounce pisco",
  "3/4 ounce lemon juice",
  "1/4 ounce yuzu juice",
  "1/2 ounce simple syrup",
  "1/2 ounce egg white",
  "Garnish: edible flower (optional)",
  "2 1/2 ounces gin",
  "1/2 ounce lime juice, freshly squeezed",
  "1/2 ounce simple syrup",
  "Garnish: lime wheel",
  "1 ounce Midori",
  "1 ounce vodka",
  "1/2 ounce lemon juice, freshly squeezed",
  "1/2 ounce lime juice, freshly squeezed",
  "Club soda, to top",
  "Garnish: lemon wheel",
  "3/4 ounce vodka",
  "3/4 ounce light rum",
  "1/2 ounce blue curaçao",
  "3 ounces pineapple juice",
  "1 ounce sweet and sour mix (ingredient below)",
  "Garnish: pineapple wedge",
  "Garnish: cocktail umbrella",
  "1 1/4 ounces light rum",
  "1 1/4 ounces dark rum",
  "2 ounces pineapple juice",
  "1 ounce orange juice, freshly squeezed",
  "3/4 ounce lime juice, freshly squeezed",
  "1/2 ounce grenadine",
  "Garnish: maraschino cherry",
  "2 ounces light rum",
  "1 ounce lime juice, freshly squeezed",
  "3/4 ounce demerara sugar syrup",
  "Garnish: lime twist",
  "2 tablespoons sugar",
  "1 orange, cut into wedges",
  "1 apple, cored and diced",
  "1 lemon, cut into wedges",
  "1/2 cup brandy",
  "1/2 cup orange juice",
  "1 bottle dry red wine",
  "Garnish: orange wheel",
  "1 ounce light rum",
  "1 ounce navy-strength rum",
  "1 ounce banana liqueur (such as Giffard Banane du Bresil)",
  "1/2 ounce blackberry liqueur (such as Giffard Creme de Mure)",
  "2 ounces pineapple juice",
  "1 ounce lime juice, freshly squeezed",
  "1/2 ounce grenadine",
  "Garnish: brandied cherry",
  "Garnish: pineapple wedge",
  "2 ounces vodka",
  "3/4 ounce lime juice, freshly squeezed",
  "1/2 ounce simple syrup",
  "Garnish: lime wheel",
  "2 ounces rum, divided",
  "1 cup strawberries, chopped",
  "1 ounce lime juice, freshly squeezed",
  "1/2 ounce simple syrup",
  "2 ounces cream of coconut",
  "2 ounces pineapple juice",
  "Garnish: pineapple slice",
  "4 mint leaves",
  "1/2 ounce light agave nectar",
  "1 1/2 ounces blanco tequila",
  "1/2 ounce lime juice, freshly squeezed",
  "1/2 ounce watermelon juice",
  "Garnish: mint sprig",
  "Garnish: watermelon slice",
  "2 ounces Pusser’s rum",
  "4 ounces pineapple juice",
  "1 ounce orange juice, freshly squeezed",
  "1 ounce cream of coconut",
  "Garnish: nutmeg, freshly grated",
  "Garnish: pineapple wedge",
  "2 ounces vodka",
  "3/4 ounce orange liqueur",
  "3/4 ounce lime juice, freshly squeezed",
  "1 ounce butterscotch schnapps",
  "1 ounce vanilla vodka",
  "6 ounces cream soda",
  "Garnish: whipped cream",
  "Garnish: butterscotch syrup",
  "Garnish: butterscotch whipped cream (ingredient below)",
  "1-8.4 ounce can energy drink, such as Red Bull",
  "1 1/2 ounces Jägermeister",
  "Celery salt",
  "1 lemon wedge",
  "1 lime wedge",
  "2 ounces vodka",
  "4 ounces tomato juice",
  "2 teaspoons prepared horseradish",
  "2 dashes Tabasco sauce",
  "2 dashes Worcestershire sauce",
  "1 pinch ground black pepper",
  "1 pinch smoked paprika",
  "Garnish: parsley sprig",
  "Garnish: 2 green olives",
  "Garnish: lime wedge",
  "Garnish: celery stalk (optional)",
  "1 1/2 ounces vanilla vodka",
  "1/2 ounce passion fruit liqueur (such as Passoã or De Kuyper)",
  "1 ounce passion fruit puree",
  "1/2 ounce lime juice, freshly squeezed",
  "1/2 ounce vanilla simple syrup",
  "2 ounces sparkling wine, chilled",
  "Garnish: 1/2 passion fruit, fresh",
  "2 ounces blanco tequila",
  "3/4 ounce orange liqueur",
  "1 ounce lime juice, freshly squeezed",
  "1 cup ice",
  "Garnish: salt rim",
  "Garnish: lime wheel",
  "2 ounces light rum",
  "1 1/2 ounces cream of coconut, like Coco López",
  "1 ounce pineapple juice",
  "1/2 ounce lime juice, freshly squeezed",
  "1 cup pineapple chunks, frozen",
  "1 cup ice",
  "Garnish: pineapple wedge",
  "Garnish: Maraschino cherry",
  "Garnish: Pineapple leaf (optional)",
  "1 1/2 ounces vodka",
  "1/2 ounce peach schnapps",
  "1/2 ounce Chambord or creme de cassis (optional)",
  "1 1/2 ounces orange juice, freshly squeezed",
  "1 1/2 ounces cranberry juice",
  "Garnish: cocktail umbrella",
  "4 ounces white rum",
  "2 ounces lime juice, freshly squeezed",
  "2 ounces simple syrup",
  "Garnish: 2 lime wheels",
  "3/4 ounce gin",
  "1/4 ounce Benedictine",
  "1/4 ounce Grand Marnier",
  "1/4 ounce Heering cherry liqueur",
  "1 ounce pineapple juice",
  "1/2 ounce lime juice, freshly squeezed",
  "Club soda, chilled, to top",
  "1 dash Angostura bitters",
  "Garnish: orange slice",
  "Garnish: cherry",
  "8–10 lime or lemon wedges",
  "8–10 celery stalks, with leaves",
  "1/2 cup plus 1 tablespoon prepared jerk seasoning",
  "1 large block of ice",
  "1/2 ounce Chambord liqueur or Pomegranate Grenadine",
  "1 ounce pasteurized egg whites or 1/2 ounce half-and-half",
  "1 1/4 quarts whole milk",
  "1/2 ounce Chambord or creme de cassis (optional)",
  "750 milliliters (1 bottle) white, añejo or spiced Puerto Rican rum",
  "2 (750 ml) bottles claret of choice",
  "2 (750 ml) bottles Champagne or other sparkling white wine"
]

$measurement_unit = [
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
  "dash",
  "dashes",
  "wedges",
  "stalks",
  "ml"
]

def parse_ingredient_section(ingredient_section)
  parsed_ingredients = []
  ingredient_section.each do |ingredient|
    parsed_ingredients << parse_ingredient(ingredient)
  end
  parsed_ingredients.each do |info|
    puts "Original: #{info[:original]}"
    puts "Name: #{info[:name]}"
    puts "Quantity: #{info[:quantity]}"
    puts "Unit: #{info[:unit]}"
    puts "Description: #{info[:description]}"
    puts "\n"
  end
end

private

def parse_ingredient(ingredient)
  name, quantity, unit, description = "", "", "", ""
  case ingredient
  when /\AGarnish:/
    parse_garnish_ingredient(ingredient, name, quantity, unit, description)
  when /\(1 bottle\)/
    parse_bottle_ingredient(ingredient, name, quantity, unit, description)
  when /bottles/
    parse_bottles_ingredient(ingredient, name, quantity, unit, description)
  when /plus/
    parse_plus_ingredient(ingredient, name, quantity, unit, description)
  else
    parse_other_ingredient(ingredient, name, quantity, unit, description)
  end
  [name, quantity, unit, description].each do |variable|
    if variable == "" then variable = nil end
  end
  {
    original: ingredient&.strip&.downcase,
    name: name&.strip&.downcase,
    quantity: quantity&.strip&.downcase,
    unit: unit&.strip&.downcase,
    description: description&.strip&.downcase
  }
end

def parse_garnish_ingredient(ingredient, name, quantity, unit, description)
  main_split = ingredient.split(/,|\((.*)\)/, 2)
  name_split = main_split[0]
  desc_split = main_split[1]

  if name_split =~ /\d/
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
end

def parse_bottle_ingredient(ingredient, name, quantity, unit, description)
  main_split = ingredient.split(/,|\((.*)/, 2)
  name_split = main_split[0]
  desc_split = main_split[1]
  desc_split = desc_split.delete_prefix("1 bottle) ")
  
  if name_split =~ /\d/
    sub_name_split = name_split.split

    sub_name_split.each_with_index do |element, index|
      if element =~ /\d/  && index <= 1
        quantity << element
        quantity << " "

      elsif $measurement_unit.include?(element)
        unit << element
      else
        name << element
        name << " "

      end
    end
  else
    name << name_split

  end
  if desc_split.include?(",")
    desc_split = desc_split.sub(",", "")
  end
  sub_desc_split = desc_split.split
  name << sub_desc_split.first
  name << " "
  name << sub_desc_split.last
end

def parse_bottles_ingredient(ingredient, name, quantity, unit, description)
  ingredient_copy = ingredient
  ingredient_copy = ingredient_copy.gsub("(", "")
  ingredient_copy = ingredient_copy.gsub(")", "")
  ingredient_copy = ingredient_copy.gsub("bottles", "")

  if ingredient_copy.include?("of choice")
    description << "of choice"
    ingredient_copy = ingredient_copy.gsub("of choice", "")
  end

  main_split = ingredient_copy.split

  number_of, amount = nil, nil
  sub_split = []
  description_flag = false

  main_split.each_with_index do |element, index|
    if element =~ /\d/ && index == 0 then number_of = element.to_i
    elsif element =~ /\d/ && index == 1 then amount = element.to_i
    elsif $measurement_unit.include?(element) then unit << element
    else
      sub_split << element
    end
  end

  sub_split.each_with_index do |element, index|
    if element == "or"
      description_flag = true
    end
    if description_flag == false
      name << element
      name << " "
    elsif description_flag == true
      description << element
      description << " "
    end
  end

  quantity << (number_of * amount).to_s
end

def parse_plus_ingredient(ingredient, name, quantity, unit, description)
  main_split = ingredient.split("plus", 2)
  name_split = main_split[0]
  desc_split = main_split[1]
  description = "plus "

  if name_split =~ /\d/
    sub_name_split = name_split.split

    sub_name_split.each_with_index do |element, index|
      if element =~ /\d/  && index <= 1
        quantity << element
        quantity << " "

      elsif $measurement_unit.include?(element)
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

      elsif $measurement_unit.include?(element)
        description << element

      else
        name << element
        name << " "

      end
    end
  else
    name << name_split
  end
end

def parse_other_ingredient(ingredient, name, quantity, unit, description)
  if ingredient =~ /\bor\b/
    extra_desc_holder = ""
    main_split = ingredient.split(/\bor\b/, 2)
    name_split = main_split[0]
    desc_split = main_split[1]
    desc_split.prepend("or")
    if name_split.include?("fresh")
      name_split = name_split.sub("fresh", "")
    end
    if $measurement_unit.include?(desc_split.split.last)
      name_split << desc_split.split.last
      desc_split = desc_split.sub(desc_split.split.last, "")
    end
  elsif ingredient.include?("," || "(")
    main_split = ingredient.split(/,|\((.*)\)/, 2)
    name_split = main_split[0]
    desc_split = main_split[1]
  else
    main_split = ingredient.split(/,|\((.*)\)/, 2)
    name_split = main_split[0]
    desc_split = main_split[1]
  end

  if name_split =~ /\d/
    sub_name_split = name_split.split

    sub_name_split.each_with_index do |element, index|
      if element =~ /\d/  && index <= 1
        quantity << element
        quantity << " "

      elsif $measurement_unit.include?(element) && unit == ""
        unit << element

      elsif element == "(optional)"
        extra_desc_holder << element

      else
        name << element
        name << " "

      end
    end
  else
    name << name_split

  end
  if desc_split then description << desc_split end
  if extra_desc_holder then description << extra_desc_holder end
end

parse_ingredient_section(ingredient_section)