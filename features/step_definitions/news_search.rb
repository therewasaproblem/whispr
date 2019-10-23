Given("I'm on the home page") do
    visit "/"
end

Given("we have news with the {string} keyword") do |keyword|
    @keyword = keyword
    FactoryBot.create(:news, title: "#{@keyword} news")
    FactoryBot.create(:news, title: "Other news")
end

Given("we don't have news with the {string} keyword") do |keyword|
    @keyword = keyword
    # Não ter noticias = não ter noticias com a keyword X :)
end

When("I type that keyword into the search bar") do
    fill_in "Search", with: @keyword
end

When("I press Enter") do
    search = find_field "Search"
    search.send_keys :enter
end

Then("I should see only the news with that keyword") do
    titles = find_all(".card-title")
    titles.length.should be > 0
    titles.each do |title|
        title.should have_content @keyword
    end
end

Then("I should see a {string} message") do |message|
    page.should have_content message
end
