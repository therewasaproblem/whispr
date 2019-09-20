Rails.application.routes.draw do
    root 'welcome#hello'
    devise_for :users
    get "/rss", to: "rss#index"
    get "/rss/search", to: "rss#search"
end
