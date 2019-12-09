Rails.application.routes.draw do
    root 'application#hello'
    devise_for :users
    get "/news", to: "news#index"
    get "/news/latest", to: "news#search_by_access"
    get "/news/search", to: "news#search"
    get "news/prefered_search", to: "news#prefered_search"
    get "/news/access", to: "news#news_access_counter"
    get "/favorites", to: "favorites#index"
    get "/category", to: "category#index"
    get "/about", to: "about#index"
    post "/category/submit", to: "category#submit"
    get "/favorites/save", to: "favorites#save"
    get "/favorites/delete", to: "favorites#delete"
end
