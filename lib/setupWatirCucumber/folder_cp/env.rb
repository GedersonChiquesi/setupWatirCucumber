require 'setupWatirCucumber'

browser = Watir::Browser.new :chrome
browser.driver.manage.window.maximize

Before do
  @browser = browser
end

at_exit do 
  browser.cookies.clear
  browser.close
end