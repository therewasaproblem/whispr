class ApplicationController < ActionController::Base
    def hello
        @items = News.order(id: :desc).limit(3)
        render "index", layout: "application"
    end
end
