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

Source.create name: "Folha-Mundo", language: "pt-br",
              homepage_url: "https://www1.folha.uol.com.br/mundo/",
              feed_url: "https://feeds.folha.uol.com.br/mundo/rss091.xml"

Source.create name: "Folha-Educacao", language: "pt-br",
              homepage_url: "https://www1.folha.uol.com.br/educacao/",
              feed_url: "https://feeds.folha.uol.com.br/educacao/rss091.xml"

Source.create name: "G1", language: "pt-br",
              homepage_url: "https://g1.globo.com/",
              feed_url: "https://g1.globo.com/rss/g1/"

Source.create name: "Tecmundo", language: "pt-br",
              homepage_url: "https://www.tecmundo.com.br/",
              feed_url: "https://www.tecmundo.com.br/rss"

Source.create name: "BBC-primeira-pagin", language: "pt-br",
              homepage_url: "https://www.bbc.com/portuguese",
              feed_url: "http://feeds.bbci.co.uk/portuguese/rss.xml"

Source.create name: "Valor", language: "pt-br",
              homepage_url: "https://www.valor.com.br",
              feed_url: "https://www.valor.com.br/rss"

