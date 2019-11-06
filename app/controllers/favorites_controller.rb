class FavoritesController < ActionController::Base
    def save
        id = params[:id]
        @user = current_user
        news = News.find(id)
        if @user.news.where(:id=>id).blank?
            @user.news << news
            @user.save
        end        
    end

    def delete
        id = params[:id]
        @user = current_user
        if @user.news.where(:id=>id).present?
            news = @user.news.find(id)
            @user.news.delete(news)
        end
    end    

    def index
        @user = current_user
        @items = @user.news.limit(20)
        render "index", layout: "application"
    end
end