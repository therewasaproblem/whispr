Rails.application.routes.draw do
    root 'application#hello'
    devise_for :users
    get "/news", to: "news#index"
    get "/news/search", to: "news#search"
    get "/news/access", to: "news#news_access_counter"
    get "/category", to: "category#index"
    get "/about", to: "about#index"
    post "/category/submit", to: "category#submit"
end
