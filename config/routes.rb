Rails.application.routes.draw do
  resources :news_counters
    root 'application#hello'
    devise_for :users
    get "/news", to: "news#index"
    get "/news/search", to: "news#search"
    get "/news/about", to: "about#index"  
    get "/news/like", to: "news#searchLikeUp"
    get "/news/dislike", to: "news#searchLikeDown"
end
