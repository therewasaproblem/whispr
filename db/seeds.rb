# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Source.create name: "UOL", language: "pt-br",
              homepage_url: "https://www.uol.com.br/",
              feed_url: "http://rss.uol.com.br/feed/noticias.xml",
              feed_options: { encoding: "Windows-1252" }
