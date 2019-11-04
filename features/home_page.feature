Feature: Home Page
	The Home Page must be different when use is or isn't signed in.

	Scenario: At home Page and not signed in
		Given I am on the home page and not signed in
		Then I should see "Bem Vindo!"
		And I should see "Cadastrar"
		And I should see "Entrar"

	Scenario: At home page and signed in
		Given I am on the home page and signed in
		Then I should see "Bem Vindo!"
		And I should see "Notícias para você"
