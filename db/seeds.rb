require 'open-uri'
require 'json'
require 'pry-byebug'
require 'faker'

if Dose.all.empty?
  puts "destroy..."
  Ingredient.destroy_all
  Cocktail.destroy_all
  Dose.destroy_all


  Ingredient.create(name: "lemon")
  Ingredient.create(name: "ice")
  Ingredient.create(name: "mint leaves")

  puts "parsing..."

  url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
  data = JSON.parse(open(url).read)

  puts "iterating..."

  data["drinks"].each do |element|
    Ingredient.create(name: element.values[0])
  end

  puts "adding cocktails..."
  array = ("A".."Z").to_a
  array2 = "bake barbecue baste batter beat bind blacken blanch blend boil bone braise bread brew broil brown brush burn butterfly".split(" ").sample.capitalize
  space = " "
  array.each do |letter|
    a = Cocktail.create(name: "Cocktail " + letter)
    num = rand(1..9).to_s
    string = array2 + space + num + "00g"
    Dose.create(description: string, cocktail_id: a.id, ingredient_id:Ingredient.all.sample.id)
  end
else
  puts "Adding doses..."
  20.times {
    array2 = "bake barbecue baste batter beat bind blacken blanch blend boil bone braise bread brew broil brown brush burn butterfly".split(" ").sample.capitalize
    space = " "
    num = rand(1..9).to_s
    string = array2 + space + num + "00g"
    Dose.create(description: string, cocktail_id: Cocktail.all.sample.id, ingredient_id:Ingredient.all.sample.id)
  }
end

puts "finished!"

