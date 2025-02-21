# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

file = URI.parse("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg").open
article = Article.new(title: "NES", body: "A great console")
article.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
article.save

ash = Trainer.create(name: "Ash Ketchum", age: 18)
ash.photo.attach(io: URI.open('https://upload.wikimedia.org/wikipedia/en/e/e4/Ash_Ketchum_Journeys.png'), filename: 'ash_ketchum.png', content_type: 'image/png')
puts "Ash arrived in the arena!"
## Now we do the same for the next Trainers, Misty and Brock

lillie = Trianer.create(name: "Lillie", age: 16)
lillie.photo.attach(io: URI.open('https://upload.wikimedia.org/wikipedia/en/e/e3/Lillie_Sun_and_Moon.png', filename: '180px-Lilly.png', content_type: 'image/png'))
puts "Lillie is there, too!"

misty = Trianer.create(name: "Misty", age: 20)
misty.photo.attach(io: URI.open('https://upload.wikimedia.org/wikipedia/en/b/b1/MistyEP.png'), filename: 'misty.png', content_type: 'image/png')
puts "Misty is ready to go!"

puts 'Creating pokemons...'
response = URI.open('https://pokeapi.co/api/v2/pokemon?limit=100').read
results = JSON.parse(response)['results']
results.each do |result|
  info = JSON.parse(URI.open(result['url']).read)
  pokemon =Pokemon.create(name: info['name'].capitalize, element_type: info['types'].first['type']['name'])
  pokemon.photo.attach(io: URI.open(info['sprites']['front_default']), filename: "#{info['name']}.png", content_type: 'image/png')
  puts "Screeahhhhh! #{pokemon.name} created!"
end

puts 'Creating pokeballs...'
towns = ["Vermilion City", "Cerulean City", "Pewter City", "Saffron City", "Celadon City", "Cinnabar Island", "Fuchsia City"]
Trainer.all.each do |trainer|
  Pokemon.all.sample(3).each do |pokemon|
    Pokeball.create(trainer: trainer, pokemon: pokemon, caught_on: Date.today, location: towns.sample)
    puts "Pokeball created for #{trainer.name} with #{pokemon.name}!"
  end
end

puts "Finished! Created #{Trainer.count} trainers, #{Pokemon.count} pokemons, and #{Pokeball.count} pokeballs."
