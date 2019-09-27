require 'rails_helper' 
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe NewsFeedUpdateWorker, type: :worker do
    let(:source) {
        Source.create name: "Ruby", language: "en",
                      homepage_url: "https://www.ruby-lang.org/",
                      feed_url: "https://www.ruby-lang.org/en/feeds/news.rss"
    }

    let(:source_with_feed_options) {
        Source.create name: "UOL", language: "pt-br",
                      homepage_url: "https://www.uol.com.br/",
                      feed_url: "http://rss.uol.com.br/feed/noticias.xml",
                      feed_options: { encoding: "Windows-1252" }
    }

    let(:category) { Category.create tag: "geral", description: "Geral" }

    it "should add news to the database" do
        expect(News.count).to eq(0)
        NewsFeedUpdateWorker.new.perform source.id, category.id, source.feed_url
        expect(News.count).to be > 0
    end

    it "should work with feeds that have specific feed options" do
        expect(News.count).to eq(0)
        NewsFeedUpdateWorker.new.perform source_with_feed_options.id, category.id,
            source_with_feed_options.feed_url,
            source_with_feed_options.feed_options
        expect(News.count).to be > 0
    end
end