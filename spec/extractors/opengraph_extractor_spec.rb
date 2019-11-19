require 'rails_helper'

RSpec.describe OpengraphExtractor, type: :extractor do
    let(:opengraph_fixture) { file_fixture("opengraph-example.html") }
    let(:page_without_opengraph) { file_fixture("example-without-opengraph.html") }

    it "should be able to extract image URLs from pages with Opengraph metadata" do
        image_url = OpengraphExtractor.extract_image_from_url(opengraph_fixture)

        expect(image_url).to eq("https://f.i.uol.com.br/fotografia/2019/10/31/15725501155dbb35e31485a_1572550115_3x2_rt.jpg")
    end

    it "should return nil when the page doesn't contain Opengraph metadata" do
        image_url = OpengraphExtractor.extract_image_from_url(page_without_opengraph)

        expect(image_url).to be nil
    end
end
