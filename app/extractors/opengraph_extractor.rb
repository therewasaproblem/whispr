require 'ogp'

module OpengraphExtractor
    def OpengraphExtractor.extract_image_from_url(url)
        open(url) do |response|
            begin
                open_graph = OGP::OpenGraph.new response.read
                
                return open_graph.image.url
            rescue OGP::MissingAttributeError
                return nil
            end
        end
    end
end