FactoryBot.define do
    factory :news do
        title { "News Title" }
        summary { "Something happened somewhere" }
        url { "http://news.com/news-title.html" }
    end
end