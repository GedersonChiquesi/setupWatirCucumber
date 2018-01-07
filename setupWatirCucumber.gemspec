
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "setupWatirCucumber/version"

Gem::Specification.new do |spec|
  spec.name          = "setupWatirCucumber"
  spec.version       = SetupWatirCucumber::VERSION
  spec.authors       = ["Gederson Chiquesi"]
  spec.email         = ["geehchiquesi@hotmail.com"]

  spec.summary       = "A gem for setup BDD automation with cucumber and Watir Framework"
  spec.description   = "A gem for setup BDD automation with cucumber and Watir Framework, create a env with initialize browser :chrome"
  spec.homepage      = "https://github.com/GedersonChiquesi/setupWatirCucumber"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency 'rspec', '~> 3.7', '~> 3.0'
  spec.add_dependency 'cucumber', '~> 3.1', '>= 3.1.0'
  spec.add_dependency "watir", "~> 6.10"
  spec.add_dependency 'chromedriver-helper', '~> 1.1', '>= 1.1.0'
  spec.add_dependency "thor", "~> 0.20"

end
