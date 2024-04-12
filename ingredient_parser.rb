class IngredientParser
  MEASUREMENT_UNIT = [
    "milliliters", "teaspoon", "teaspoons", "tablespoon", "tablespoons",
    "ounce", "ounces", "cup", "cups", "pint", "pints", "quart", "quarts",
    "gallon", "gallons", "sprigs", "pieces", "whole", "dash", "dashes", "wedges", "stalks", "ml"
  ].freeze

  def self.parse_ingredient_section(ingredient_section)
    parsed_ingredients = []
    ingredient_section.each do |ingredient|
      parsed_ingredients << parse_ingredient(ingredient)
    end
    parsed_ingredients
  end

  private

  def self.parse_ingredient(ingredient)
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

  def self.parse_garnish_ingredient(ingredient, name, quantity, unit, description)
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

  def self.parse_bottle_ingredient(ingredient, name, quantity, unit, description)
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

        elsif MEASUREMENT_UNIT.include?(element)
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

  def self.parse_bottles_ingredient(ingredient, name, quantity, unit, description)
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
      elsif MEASUREMENT_UNIT.include?(element) then unit << element
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

  def self.parse_plus_ingredient(ingredient, name, quantity, unit, description)
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

        elsif MEASUREMENT_UNIT.include?(element)
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

        elsif MEASUREMENT_UNIT.include?(element)
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

  def self.parse_other_ingredient(ingredient, name, quantity, unit, description)
    if ingredient =~ /\bor\b/
      extra_desc_holder = ""
      main_split = ingredient.split(/\bor\b/, 2)
      name_split = main_split[0]
      desc_split = main_split[1]
      desc_split.prepend("or")
      if name_split.include?("fresh")
        name_split = name_split.sub("fresh", "")
      end
      if MEASUREMENT_UNIT.include?(desc_split.split.last)
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

        elsif MEASUREMENT_UNIT.include?(element) && unit == ""
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
end