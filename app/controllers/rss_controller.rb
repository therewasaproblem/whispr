require 'rss'
require 'open-uri'

class RssController < ActionController::Base
    def buscarNoticias(url)
        open(url) do |rss|
            contents = rss.read.encode("UTF-8")
            feed = RSS::Parser.parse(contents, false)
            return feed.items
        end
    end

    def index
        @items = buscarNoticias("http://rss.uol.com.br/feed/noticias.xml")
        render "index", layout: "application"
    end

    def search
	@keyword = params[:q]
        @items = buscarNoticias("http://rss.uol.com.br/feed/noticias.xml")        
	@items = @items.select { |item| item.title.downcase.include? params[:q].downcase }
        render "search", layout: "application"
    end
end
