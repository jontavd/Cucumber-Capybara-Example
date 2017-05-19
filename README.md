# Cucumber-Capybara-Example
POC testing to measure knowledge in automation testing tools
For this project I will be using Cucumber, Capybara, Ruby and Selenium Web-Driver

Important: All BDD scenarios are in Brazilian Portuguese

Scenario:
A normal flow where a user navigates in a online store, looks for a product, select the product to the shopping cart, login with a pre-registered user and verify if the shopping cart remains the same before the authentication

# Installation / Requirements

Ruby
https://www.ruby-lang.org/

Cucumber
https://cucumber.io/

Capybara
https://github.com/teamcapybara/capybara

Selenium Web-Driver
https://rubygems.org/gems/selenium-webdriver


Useful commands after installation in the terminal / command prompt:

- install the gem mechanism to download packages:

gem install


- download all the pre-requisite packages for this example work correctly:

gem bundle (run in the root foolder)


** IMPORTANT - Execution:

For security reasons the username and password are not stored in this project, you will need to put the user and password as parameter when running cucumber. Usage (in the project root folder):

cucumber user=<your_user> pass=<your_password>


For pre-registration visit: https://www.walmart.com.br/
