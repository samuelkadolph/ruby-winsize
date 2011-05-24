$:.push(File.expand_path("../lib", __FILE__))
require "winsize/version"

Gem::Specification.new do |s|
  s.name        = "winsize"
  s.version     = WinSize::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Samuel Kadolph"]
  s.email       = ["samuel@kadolph.com"]
  s.homepage    = "https://github.com/samuelkadolph/ruby-winsize"
  s.summary     = %q{Small library that adds methods for getting and setting the winsize of any TTY IO object.}
  s.description = %q{ruby-winsize adds two methods (winsize and winsize=) to for use with any IO instance for a TTY device. } +
                  %q{The Winsize::Winsize class is an intermediate form that is used for ioctl calls to the TTY device.}

  s.files      = Dir["{ext,lib}/**/*"] + ["LICENSE", "README.md"]
  s.extensions = ["ext/extconf.rb"]
end
