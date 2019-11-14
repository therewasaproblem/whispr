Feature: Favorite News
    Saving news as favorites helps the user the see that news later.

    @javascript
    Scenario: Clicking favorites link
        Given I'm on the index page and logged in
        And we have favorited news 
        When I click the favorites link
        Then I should see the news that i saved as favorites
    
    @javascript
    Scenario: No favorites saved
        Given I'm on the index page and logged in
        And we don't have favorited news
        When I click the favorites link
        Then I should see the message "Nenhuma notícia favoritada"
