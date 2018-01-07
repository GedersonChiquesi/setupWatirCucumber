require "setupWatirCucumber/version"
require "watir"
require "rspec"
require 'cucumber'
require 'thor'

module SetupWatirCucumber
  class CucumberInit
    def initialize(path)
        init(path)
    end

    def init(path)
      cucumber_init(path)
      create_env(path)
      create_hooks(path)
      create_config_yml(path)
      create_base_scenario(path)
      create_base_step(path)
    end

    def cucumber_init(path)
      puts "cucumber --int"
      system "cd #{path} && cucumber --init"
    end

    def create_env(path) 
      puts "Configuring env.rb file"
      File.open("#{path}/features/support/env.rb","w+") do |f|
        f.write "require 'setupWatirCucumber'\n\nbrowser = Watir::Browser.new :chrome\nbrowser.driver.manage.window.maximize\n\nBefore do\n @browser = browser\nend\n\nat_exit do\n browser.cookies.clear\n browser.close\nend"
      end

    end

    def create_hooks(path)
      puts "Configuring hooks.rb file"
      File.open("#{path}/features/support/hooks.rb", "w+") do |f|
        f.write '
Before do |scenario|
  @path_screenshots = "screenshots/#{scenario.feature.name}/#{scenario.name}"
  FileUtils.mkpath @path_screenshots 
end

AfterStep do |step|
  screenshot = "#{@path_screenshots}/#{Time.now.strftime("%d%m%Y%H%M")}.png"
  @browser.screenshot.save(screenshot)
  embed screenshot , "image/png"
end

After do |scenario|
  @browser.cookies.clear rescue warn "No session to clear"
  @browser.refresh
end'
      end
    end

    def create_config_yml(path)
      puts "configuring cucumber.yml file"
      system "mkdir #{path}/config/"
      File.open("#{path}/config/cucumber.yml", "w+") do |f|
        f.write "
# config/cucumber.yml
##YAML Template
---
html_report: --format pretty --format html --out=features_report.html"
      end
    end

    def create_base_scenario(path)
      puts "Configuring base.feature file"
      File.open("#{path}features/base.feature", "w+") do |f|
        f.write '
Feature: Medium

  Scenario: Find user Gederson Chiquesi
    Given that I am in the website http://medium.com
    When I search for GedersonChiquesi
    Then I should see the user "Gederson Chiquesi"
        '
      end
    end

    def create_base_step(path)
      puts "configuring base_steps.rb file"
      File.open("#{path}/features/step_definitions/base_steps.rb","w+") do |f|
        f.write '
Given("that I am in the website http://medium.com") do
  @browser.goto "http://medium.com"
  expect(@browser.title).to eq("Medium – Read, write and share stories that matter")
end

When("I search for GedersonChiquesi") do
  @browser.text_field(:class => "js-predictiveSearchInput").set "GedersonChiquesi"
end

Then("I should see the user {string}") do |string|
  user = @browser.div.span(:class => "avatar-text").text
  expect(user).to eq("Gederson Chiquesi")
  puts user
end        
        '
      end
    end
  end

  class CLI < Thor
    desc 'create --from "{location}"', "where the setup will be created"
    option :from
    def create()
      raise "Not location set, please set location with --from" unless options[:from]
      SetupWatirCucumber::CucumberInit.new options[:from]
    end
  end
end
