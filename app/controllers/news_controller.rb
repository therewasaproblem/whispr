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

 
    
end
