require 'rails_helper'

RSpec.describe RSSFeed, type: :model do
  it "should work with standard RSSes" do
    feed = RSSFeed.new "https://www.ruby-lang.org/en/feeds/news.rss"
    expect(feed.items).to_not be_empty
  end

  it "should manage to parse feeds with different encodings" do
    feed = RSSFeed.new "http://rss.uol.com.br/feed/noticias.xml", encoding: "Windows-1252"
    expect(feed.items).to_not be_empty
  end
end
