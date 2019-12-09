class NewsController < ActionController::Base
    def index
        @items = News.order(id: :desc).limit(20)
        render "index", layout: "application"
    end

    def search
	    @keyword = params[:q]
        @items = News.order(id: :desc)
                     .where("title ILIKE ?", "%#{@keyword}%").limit(20)
        render "search", layout: "application"
    end

    def prefered_search
            @keyword = params[:q]
	@items = News.joins("JOIN categories_users as cusers ON news.category_id = cusers.category_id JOIN categories as c ON news.category_id = c.id JOIN users as u ON cusers.user_id = u.id").where(u: { id: current_user.id } ).where("title ILIKE ?", "%#{@keyword}%").limit(20)
	render "prefered_search", layout:"application"
    end

    def search_by_access
        @itemsOrdered = News.order(access: :desc).limit(20)
        render "search_by_access", layout: "application"
    end

    def news_access_counter
	if user_signed_in?
        news = News.find(params[:id])
    	news.access = news.access + 1
	news.save
	render html: news.access
	else render html: 0    	
	end
    end
end
