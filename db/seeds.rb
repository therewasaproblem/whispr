# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tec = Category.create tag: "Tecnologia", description: "Fontes a respeito de Tecnologias"
edu = Category.create tag: "Educacao", description: "Fontes a respeito de Educacao"
sau = Category.create tag: "Saude", description: "Fontes a respeito de Saude"
nat = Category.create tag: "Natureza", description: "Fontes a respeito da Natureza"
pol =  Category.create tag: "Politica", description: "Fontes a respeito de Politica"

Source.create name: "UOL Tecnologia", language: "pt-br",
              homepage_url: "https://www.uol.com.br/",
              feed_url: "http://rss.uol.com.br/feed/tecnologia.xml",
              feed_options: { encoding: "Windows-1252" },
              category: tec

Source.create name: "UOL Educacao", language: "pt-br",
              homepage_url: "https://www.uol.com.br/",
              feed_url: "http://rss.uol.com.br/feed/vestibular.xml",
              feed_options: { encoding: "Windows-1252" },
              category: edu

Source.create name: "G1 Tecnologia", language: "pt-br",
              homepage_url: "https://g1.globo.com/",
              feed_url: "https://g1.globo.com/rss/g1/tecnologia/",
              category: tec

Source.create name: "G1 Educacao", language: "pt-br",
              homepage_url: "https://g1.globo.com/",
              feed_url: "https://g1.globo.com/rss/g1/educacao/",
              category: edu

Source.create name: "G1 Saude", language: "pt-br",
              homepage_url: "https://g1.globo.com/",
              feed_url: "https://g1.globo.com/rss/g1/ciencia-e-saude/",
              category: sau

Source.create name: "G1 Natureza", language: "pt-br",
              homepage_url: "https://g1.globo.com/",
              feed_url: "https://g1.globo.com/rss/g1/natureza/",
              category: nat

Source.create name: "G1 PLaneta", language: "pt-br",
              homepage_url: "https://g1.globo.com/",
              feed_url: "https://g1.globo.com/rss/g1/planeta-bizarro/",
              category: nat

Source.create name: "G1 Politica", language: "pt-br",
              homepage_url: "https://g1.globo.com/",
              feed_url: "https://g1.globo.com/rss/g1/politica",
              category: pol

Source.create name: "Folha Educacao", language: "pt-br",
              homepage_url: "https://www1.folha.uol.com.br/mundo/",
              feed_url: "https://feeds.folha.uol.com.br/educacao/rss091.xml",
              category: edu

Source.create name: "Folha Natureza", language: "pt-br",
              homepage_url: "https://www1.folha.uol.com.br/mundo/",
              feed_url: "https://feeds.folha.uol.com.br/ambiente/rss091.xml",
              category: nat

Source.create name: "Folha Politica", language: "pt-br",
              homepage_url: "https://www1.folha.uol.com.br/mundo/",
              feed_url: "https://feeds.folha.uol.com.br/poder/rss091.xml",
              category: pol

Source.create name: "BBC Saude", language: "pt-br",
              homepage_url: "https://www.bbc.com/portuguese/",
              feed_url: "https://www.bbc.com/portuguese/topics/c4794229-7f87-43ce-ac0a-6cfcd6d3cef2",
              category: sau

Source.create name: "Tecmundo", language: "pt-br",
              homepage_url: "https://www.tecmundo.com.br/",
              feed_url: "https://www.tecmundo.com.br/rss",
              category: tec

Source.create name: "Valor", language: "pt-br",
              homepage_url: "https://www.valor.com.br",
              feed_url: "https://www.valor.com.br/politica/rss",
              category: pol
