# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

url_1 = Url.create([
  url: "https://www.rottentomatoes.com/m/the_dark_knight"
])

url_2 = Url.create([
  url: "https://www.rottentomatoes.com/m/it_comes_at_night"
])

url_3 = Url.create([
  url: "https://www.rottentomatoes.com/m/hulk/"
])

url_4 = Url.create([
  url: "https://www.rottentomatoes.com/tv/black_mirror"
])
