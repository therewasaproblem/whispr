FactoryBot.define do
    factory :news do
        title { "News Title" }
        summary { "Something happened somewhere" }
        url { "http://news.com/news-title.html" }
    end

    factory :user do
        username { "Username" }
        password { "senhaComplicada" }
        email { "test@test.com" }
    end
end
