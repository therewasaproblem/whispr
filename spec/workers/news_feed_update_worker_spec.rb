require 'rails_helper' 
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe NewsFeedUpdateWorker, type: :worker do
    before(:each) {
        # Configurar mock no extractor, para evitar chamadas HTTP.
        allow(OpengraphExtractor).to receive(:extract_image_from_url)
    }

    let(:source) {
        Source.create name: "Ruby", language: "en",
                      homepage_url: "https://www.ruby-lang.org/",
                      feed_url: file_fixture("ruby_lang.rss")
    }

    let(:source_with_feed_options) {
        Source.create name: "UOL", language: "pt-br",
                      homepage_url: "https://www.uol.com.br/",
                      feed_url: file_fixture("uol.xml"),
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

    it "should not add duplicate news" do
        expect(News.count).to eq(0)
        NewsFeedUpdateWorker.new.perform source_with_feed_options.id, category.id,
            source_with_feed_options.feed_url,
            source_with_feed_options.feed_options
        expect(News.count).to be > 0

        old_news_count = News.count

        NewsFeedUpdateWorker.new.perform source_with_feed_options.id, category.id,
            source_with_feed_options.feed_url,
            source_with_feed_options.feed_options
        
        expect(News.count).to eq(old_news_count)
    end

    it "should try to extract the image URL" do
        expect(OpengraphExtractor).to receive(:extract_image_from_url)

        NewsFeedUpdateWorker.new.perform source.id, category.id, source.feed_url
    end
end