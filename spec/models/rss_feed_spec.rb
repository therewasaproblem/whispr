require 'rails_helper'

RSpec.describe RSSFeed, type: :model do
  it "should work with standard RSSes" do
    feed = RSSFeed.new file_fixture("ruby_lang.rss")
    expect(feed.items).to_not be_empty
  end

  it "should manage to parse feeds with different encodings" do
    feed = RSSFeed.new file_fixture("uol.xml"), encoding: "Windows-1252"
    expect(feed.items).to_not be_empty
  end
end
