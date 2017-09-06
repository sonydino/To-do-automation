require 'capybara'
require 'capybara/dsl'
require 'rspec'
include RSpec::Matchers
include Capybara::DSL
Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

# @driver = Selenium::WebDriver.for( :chrome )
#==================================
page.driver.browser.manage.window.maximize