Feature: News Search
    Filtering news is necessary for giving the user relevant content.

    @javascript
    Scenario: Keyword search
        Given I'm on the home page
        And we have news with the "desired" keyword
        When I type that keyword into the search bar
        And I press Enter
        Then I should see only the news with that keyword
    
    @javascript
    Scenario: No results search
        Given I'm on the home page
        And we don't have news with the "desired" keyword
        When I type that keyword into the search bar
        And I press Enter
        Then I should see a "Nenhuma notícia encontrada" message
