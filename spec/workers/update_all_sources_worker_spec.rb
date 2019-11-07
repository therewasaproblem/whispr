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

    it "should enqueue NewsFeedUpdateWorker jobs" do
        # Neste teste, estamos no modo "fake" do Sidekiq, onde os jobs são
        # enfileirados, mas não rodados de verdade. Aproveitamos disso para
        # testar de modo fino o que cada worker faz.
        expect {       
            UpdateAllSourcesWorker.perform_async
            # Usando o drain, fazemos este worker em específico executar.
            UpdateAllSourcesWorker.drain
        }.to change {
            NewsFeedUpdateWorker.jobs.size
        }.by @sources.length
    end
end
