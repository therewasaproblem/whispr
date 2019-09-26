require 'rails_helper'

RSpec.describe News, type: :model do
  it "should not allow 2 news with the same url, title and summary" do
    first = News.new title: "X", summary: "X", url: "X"
    expect(first.save).to be true

    second = News.new title: "X", summary: "X", url: "X"
    expect(second.save).to be false
  end
end
