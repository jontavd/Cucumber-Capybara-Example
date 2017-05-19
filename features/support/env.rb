require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'uri'

Capybara.default_max_wait_time = 15
Capybara.default_driver = :selenium_chrome
Capybara.register_driver :selenium_chrome do |app|
	Capybara::Selenium::Driver.new(app, :browser => :chrome)
end