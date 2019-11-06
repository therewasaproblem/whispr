Rails.application.routes.draw do
    root 'application#hello'
    devise_for :users
    get "/news", to: "news#index"
    get "/news/search", to: "news#search"
    get "/favorites", to: "favorites#index"
    post "/favorites/save/:id", to: "favorites#save"
    delete "/favorites/delete/:id", to: "favorites#delete"
end
