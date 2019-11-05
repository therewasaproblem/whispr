class NewsController < ActionController::Base
    def index
        # FIXME Talvez ordenar por data da notícia seria bom.
        @items = News.order(id: :desc).limit(20)
        render "index", layout: "application"
    end

    def search
	@keyword = params[:q]
        @items = News.order(id: :desc)
                     .where("title ILIKE ?", "%#{@keyword}%").limit(20)
        render "search", layout: "application"
    end

 
    def searchLikeUp
	if user_signed_in?
        news = News.find(params[:id])
    	news.access = news.access + 1
	news.save
	render html: news.access
    	end
    end

    def searchLikeDown
	if user_signed_in?
        news = News.find(params[:id])
    	news.access = news.access - 1
	news.save
	render html: news.access
        end	
    end
end
