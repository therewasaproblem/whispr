Dado /^que temos notícias com informações de imagens$/ do
    FactoryBot.create(:news, image_url: "https://news.com/image.jpg")
end

Dado /^que estou na página inicial$/ do
    visit "/"
end

Quando /^procuro por notícias$/ do
    click_on "Pesquisar"
end

Então /^eu deveria ver imagens nas notícias$/ do
    expect(page).to have_css(".news-card img")
end
