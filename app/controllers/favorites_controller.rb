class FavoritesController < ActionController::Base
    def save
        id = params[:id]
        @user = current_user
        news = News.find(id)
        @user.news << news
        @user.save        
    end

    def delete
        id = params[:id]
        @user = current_user
        news = @user.news.find(id)
        @user.news.delete(news)
    end    

    def index
        @user = current_user
        @items = @user.news.limit(20)
        render "index", layout: "application"
    end
end