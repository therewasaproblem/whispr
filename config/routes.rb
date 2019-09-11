Rails.application.routes.draw do
    root 'application#hello'
    get "/rss", to: "rss#index"
    get "/rss/search", to: "rss#search"    
end
