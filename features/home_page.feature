Feature: Home Page
	The Home Page must be different when use is or isn't logged in.

	Scenario: At home Page and not singed in
		Given I am on the home page and not logged in
		Then I should see "Bem Vindo!"
		And I should see "Cadastrar"
		And I should see "Entrar"

	Scenario: At home page and singed in
		Given I am on the home page and logged in
		Then I should see "Bem Vindo!"
		And I should see "O que deseja procurar hoje?"
