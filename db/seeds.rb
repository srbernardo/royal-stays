# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

castles_data = [
  {
    name: "Majestic Castle",
    address: "123 Royal Avenue, Kingdom of Dreams",
    description: "A breathtaking castle with stunning architecture.",
    daily_rate: 500.0,
    user_id: 3
  },
  {
    name: "Enchanted Fortress",
    address: "456 Fairyland Street, Land of Wonders",
    description: "A magical fortress hidden in the heart of the forest.",
    daily_rate: 600.0,
    user_id: 3
  },
  {
    name: "Dragonstone Keep",
    address: "789 Dragonfire Road, Realm of Fire",
    description: "An ancient keep rumored to have housed dragons.",
    daily_rate: 700.0,
    user_id: 1
  },
  {
    name: "Dracula's Castle",
    address: "1 Transylvania Avenue, Land of Vampires",
    description: "The legendary castle said to be inhabited by Count Dracula himself.",
    daily_rate: 800.0,
    user_id: 1
  },
  {
    name: "Castle Greyskull",
    address: "Grayskull Mountain, Eternia",
    description: "The ancient and mysterious fortress of the Masters of the Universe.",
    daily_rate: 900.0,
    user_id: 1
  },
  {
    name: "Disney Castle",
    address: "Walt Disney World, Orlando, Florida",
    description: "The iconic fairy-tale castle that brings magic to life.",
    daily_rate: 1000.0,
    user_id: 3
  },
  {
    name: "Skyward Citadel",
    address: "Cloud City, Sky Kingdom",
    description: "A floating citadel amidst the clouds, accessible only by airships.",
    daily_rate: 850.0,
    user_id: 2
  },
  {
    name: "Atlantis Fortress",
    address: "Underwater City, Atlantis",
    description: "An ancient fortress hidden beneath the depths of the ocean.",
    daily_rate: 750.0,
    user_id: 2
  },
  {
    name: "Emerald Tower",
    address: "Verdant Valley, Land of Enchantment",
    description: "A tower made of shimmering emerald crystals that glow at night.",
    daily_rate: 650.0,
    user_id: 2
  },
  {
    name: "Super Mario Castle",
    address: "Mushroom Kingdom",
    description: "The castle where Princess Peach resides, often kidnapped by Bowser.",
    daily_rate: 550.0,
    user_id: 2
  },
]

castles_data.each do |castle_data|
  Castle.create(castle_data)
end
