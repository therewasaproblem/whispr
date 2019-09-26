require 'rails_helper' 
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe NewsFeedUpdateWorker, type: :worker do
    feed_url = "https://www.ruby-lang.org/en/feeds/news.rss"
    let(:source) { Source.create name: "Ruby", language: "en", homepage_url: feed_url }
    let(:category) { Category.create tag: "geral", description: "Geral" }

    it "should add news to the database" do
        expect(News.count).to eq(0)
        NewsFeedUpdateWorker.new.perform source.id, category.id, feed_url
        expect(News.count).to be > 0
    end
end