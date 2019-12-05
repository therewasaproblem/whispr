Rails.application.routes.draw do
    root 'application#hello'
    devise_for :users
    get "/news", to: "news#index"
    get "/news/latest", to: "news#search_by_access"
    get "/news/search", to: "news#search"
    get "news/prefered_search", to: "news#prefered_search"
    get "/news/access", to: "news#news_access_counter"
    get "/favorites", to: "favorites#index"
    post "/favorites/save/:id", to: "favorites#save"
    delete "/favorites/delete/:id", to: "favorites#delete"
    get "/category", to: "category#index"
    get "/about", to: "about#index"
    post "/category/submit", to: "category#submit"
    get "/favorites/index", to: "favorites#index"
    post "/favorites/save/:id", to: "favorites#save"
    delete "/favorites/delete/:id", to: "favorites#delete"
end
