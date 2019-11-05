require 'rails_helper' 
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe UpdateAllSourcesWorker, type: :worker do
    before(:each) {
        # Criar as sources de teste.
	tec = Category.create(tag: "Tecnologia", description: "Fontes a respeito de Tecnologias")
	
        @sources = [
            Source.create(name: "Ruby", language: "en",
                      homepage_url: "https://www.ruby-lang.org/",
                      feed_url: file_fixture("ruby_lang.rss"),
		      category: tec),
            Source.create(name: "UOL", language: "pt-br",
                      homepage_url: "https://www.uol.com.br/",
                      feed_url: file_fixture("uol.xml"),
                      feed_options: { encoding: "Windows-1252" },
		      category: tec)
        ]
    }

    it "should add news to the database" do
        expect(News.count).to eq(0)
        
        UpdateAllSourcesWorker.perform_async
        Sidekiq::Worker.drain_all # Isso força todos os workers a terminarem.

        expect(News.count).to be > 0
    end
end
