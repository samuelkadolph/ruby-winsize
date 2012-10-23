require File.expand_path("../.gemspec", __FILE__)
require File.expand_path("../lib/winsize/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "winsize"
  gem.authors     = ["Samuel Kadolph"]
  gem.email       = ["samuel@kadolph.com"]
  gem.description = readme.description
  gem.summary     = readme.summary
  gem.homepage    = "http://samuelkadolph.github.com/ruby-winsize/"
  gem.version     = Winsize::VERSION

  gem.files       = Dir["lib/**/*"]
  gem.extensions  = Dir["ext/extconf.rb"]
  gem.test_files  = Dir["test/**/*_test.rb"]

  gem.required_ruby_version = ">= 1.8.7"

  gem.add_development_dependency "bundler", "~> 1.2.1"
  gem.add_development_dependency "mocha", "~> 0.12.1"
  gem.add_development_dependency "rake", "~> 0.9.2.2"
  gem.add_development_dependency "rake-compiler", "~> 0.8.1"
end
