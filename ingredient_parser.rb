class IngredientParser
  MEASUREMENT_UNIT = [
    "milliliters", "teaspoon", "teaspoons", "tablespoon", "tablespoons",
    "ounce", "ounces", "cup", "cups", "pint", "pints", "quart", "quarts",
    "gallon", "gallons", "sprigs", "pieces", "whole", "dashes", "wedges", "stalks", "ml"
  ].freeze

  def self.parse_ingredients(recipe_paragraphs)
    recipe_info = []

    recipe_paragraphs.each do |recipe|
      name = ""
      quantity = nil
      unit = nil
      description = nil

#=================================================================

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

#================================================================
    
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
    
            elsif IngredientParser::MEASUREMENT_UNIT.include?(element)
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

#================================================================

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
    
            elsif IngredientParser::MEASUREMENT_UNIT.include?(element)
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
    
            elsif IngredientParser::MEASUREMENT_UNIT.include?(element)
              description << element
    
            else
              name << element
              name << " "
    
            end
          end
        else
          name << name_split
        end

#================================================================
    
      else
        if recipe.include?("," || "(")
          main_split = recipe.split(/,|\((.*)\)/, 2)
          name_split = main_split[0]
          desc_split = main_split[1]
        elsif recipe =~ /\bor\b/
          main_split = recipe.split(/\bor\b/, 2)
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
    
            elsif IngredientParser::MEASUREMENT_UNIT.include?(element)
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

#================================================================

      recipe_info << {
        name: name&.strip&.downcase,
        quantity: quantity&.strip&.downcase,
        unit: unit&.strip&.downcase,
        description: description&.strip&.downcase
      }
    end

    recipe_info
  end
end