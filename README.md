# ruby-winsize

ruby-winsize is a small library that lets you get and set the winsize of a terminal.

ruby-winsize adds two methods (`winsize` and `winsize=`) to for use with any
`IO` instance for a TTY device. The `Winsize::Winsize` class is an intermediate
form that is used for `ioctl` calls to the TTY device.

## Installing

### Recommended

```
gem install winsize
```

### Edge

```
git clone https://github.com/samuelkadolph/ruby-winsize
cd ruby-winsize && rake install
```

## Usage

To get the size of the `$stdout` terminal.

```ruby
require "winsize"

size = $stdout.winsize
puts "Your terminal is #{size.columns}x#{size.rows}"
puts "Your terminal is #{size.horizontal_pixels}px*#{size.vertical_pixels}px"
```

To set the size of a pty terminal.
This is useful if you are running a subshell and want the subshell to have the
same output size as the terminal you yourself are running in.

You might think it would be useful to set the winsize of `$stdout` it actually
isn't since the terminal is usually limited by the monitor size or the terminal
application and increasing the size messes with trimming logic.

```ruby
require "pty"
require "winsize"

size = Winsize.new(32, 160)
# or
# size = $stdout.winsize

in, out, pid = PTY.spawn

out.winsize = winsize
# or
# out.winsize = 32, 160
```

You may want to combine `winsize` and catching the [`SIGWINCH`](http://en.wikipedia.org/wiki/SIGWINCH) signal so you
update something that your terminal has been resized.

```ruby
require "winsize"

puts "Terminal size is #{$stdout.winsize.columns}x#{$stdout.winsize.rows}"

Signal.trap "WINCH" do
  puts "Terminal resized to #{$stdout.winsize.columns}x#{$stdout.winsize.rows}"
end
```