# Buzzy Spider
A web scraper, and data parser, written in Ruby for my cocktail recipe web app. Uses Open-URI and Nokogiri to scrape cocktail recipes from an external website's sitemap. Then calls on a parser to extract and format the scraped ingredient section, so it fits the data models and format of the cocktail recipe web app. The parser handles many different patterns that occur in the scrapped data and reformats them to fit the models as best it can. Writes to a JSON file, to later be used to seed the web app's database. Different repositories for easier management, these files will eventually be added to the main cocktail web app repository. 
