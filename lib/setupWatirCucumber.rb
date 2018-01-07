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
      puts "t"
    end

    def create_env(path) 
      puts "Configuring env.rb file"
      dir_folder = "#{path}/features/support/"
      Dir["lib/setupWatirCucumber/folder_cp/env.rb"].each do |file|
        FileUtils.cp(file,dir_folder)
      end
    end

    def create_hooks(path)
      puts "Configuring hooks.rb file"
      dir_folder = "#{path}/features/support/"
      Dir["lib/setupWatirCucumber/folder_cp/hooks.rb"].each do |file|
        FileUtils.cp(file,dir_folder)
      end
    end

    def create_config_yml(path)
      puts "configuring cucumber.yml file"
      system "mkdir #{path}/config/"
      dir_folder = "#{path}/config/"
      Dir["lib/setupWatirCucumber/folder_cp/cucumber.yml"].each do |file|
        FileUtils.cp(file,dir_folder)
      end
    end

    def create_base_scenario(path)
      puts "Configuring base.feature file"
      dir_folder = "#{path}/features/"
      Dir["lib/setupWatirCucumber/folder_cp/base.feature"].each do |file|
        FileUtils.cp(file,dir_folder)
      end
    end

    def create_base_step(path)
      puts "configuring base_steps.rb file"
      dir_folder = "#{path}/features/step_definitions"
      Dir["lib/setupWatirCucumber/folder_cp/base_steps.rb"].each do |file|
        FileUtils.cp(file,dir_folder)
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
