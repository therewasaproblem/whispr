Given("I'm on the index page and logged in") do
    visit "/"
    @user = User.create(:email => "test@cucumber.com", :password => "123456")
    visit '/users/sign_in'
    fill_in "user_email", :with => "test@cucumber.com"
    fill_in "user_password", :with => "123456"
    click_button "Log in"
end

Given("we have favorited news") do
    some_news = FactoryBot.create(:news, title: "Some news")    
    @user.news << some_news
end

Given("we don't have favorited news") do
end

When("I click the favorites link") do
    click_link "Meu Whispr"
    click_link "Favoritas"
end

Then("I should see the news that i saved as favorites") do
    body = find_all(".card-body")
    title = find(".card-title").text
    body.length.should be > 0
    expect(title).to eq("Some news")
end

Then("I should see the message {string}") do |message|
    page.should have_content message
end
