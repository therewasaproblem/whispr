Rails.application.routes.draw do
    root to: 'application#hello'
    devise_for :users
    get "/rss", to: "rss#index"
    get "/rss/search", to: "rss#search" 
end
