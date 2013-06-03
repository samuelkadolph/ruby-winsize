# ruby-winsize [![Build Status](https://secure.travis-ci.org/samuelkadolph/ruby-winsize.png?branch=master)](http://travis-ci.org/samuelkadolph/ruby-winsize)

winsize is a small library that lets you get and set the winsize of a tty.

## Description

winsize adds 2 methods: `winsize` and `winsize=` to `IO` that allows you to control the size of a tty window. Mainly used
with `pty` to deal with executables that word wrap (i.e. `top`). *If you are using ruby 1.9.3 this gem is not needed.
`require "io/console"` provides the same functionality.*

## Installation

add this line your application's Gemfile:

    gem "winsize"

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install winsize

## Usage

#### Get the size of the terminal

```ruby
require "winsize"

rows, cols = $stdout.winsize
puts "Your terminal is #{cols}x#{rows}"
```

#### Set the size of a pty terminal

```ruby
require "pty"
require "winsize"

size = Winsize.new(32, 180)
input, output, pid = PTY.spawn
output.winsize = size
```

#### Reacting to a resized terminal

You may want to combine `winsize` and catching the [`SIGWINCH`](http://en.wikipedia.org/wiki/SIGWINCH) signal so you can
react when the terminal has been resized.

```ruby
require "winsize"

puts "Terminal size is #{$stdout.winsize.cols}x#{$stdout.winsize.rows}"

Signal.trap(:WINCH) do
  puts "Terminal resized to #{$stdout.winsize.cols}x#{$stdout.winsize.rows}"
end

loop { sleep(10) }
```

#### `io/console` API compatible

```ruby
require "winsize"

$stdout.winsize.to_ary # => [32, 180]
$stdout.winsize = [32, 180]
```

## Contributing

Fork, branch & pull request.
