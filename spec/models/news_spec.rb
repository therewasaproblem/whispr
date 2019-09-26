require 'rails_helper'
require 'securerandom'

RSpec.describe News, type: :model do
  let(:very_long_title) { SecureRandom.alphanumeric(2**10) }
  let(:very_long_summary) { SecureRandom.alphanumeric(2**20) }

  it "should not allow 2 news with the same url, title and summary" do
    first = News.new title: "X", summary: "X", url: "X"
    expect(first.save).to be true

    second = News.new title: "X", summary: "X", url: "X"
    expect(second.save).to be false
  end

  it "should work even with very long titles and summaries" do
    # As vezes inserir falhava com titulos/sumários muito longos,
    # devido a falha nas criações dos índices.
    first = News.new title: very_long_title, summary: very_long_summary, url: "X"
    expect(first.save).to be true

    second = News.new title: very_long_title, summary: very_long_summary, url: "X"
    expect(second.save).to be false
  end
end
