# Modelo que realiza a busca dos items de um feed.
class RSSFeed
    def initialize(feed_url, options = {})
        @feed_url = feed_url
        # As options podem ter chaves como symbols (options[:key])
        # ou como strings (options["key"]), então é necessário chamar o
        # método abaixo.
        @options = options.with_indifferent_access
    end

    def items
        return parsed_feed ? parsed_feed.items : []
    end

    def parsed_feed
        if @parsed_feed.nil?
            open(@feed_url) do |response|
                contents = response.read

                if encoding
                    contents = contents.encode("UTF-8", encoding, invalid: :replace, undef: :replace, replace: '?')
                end

                @parsed_feed = RSS::Parser.parse(contents, false)
            end
        end
        
        @parsed_feed
    end

    def encoding 
        @options[:encoding]
    end
end
