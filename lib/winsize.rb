require "winsize.so"
require "winsize/version"

module Winsize
  class Winsize
    attr_accessor :rows, :columns, :horizontal_pixels, :vertical_pixels

    def initialize(rows, columns, horizontal_pixels = 0, vertical_pixels = 0)
      @rows, @columns, @horizontal_pixels, @vertical_pixels = rows, columns, horizontal_pixels, vertical_pixels
    end

    def [](index)
      [rows, columns][index]
    end

    def to_ioctl
      [rows, columns, horizontal_pixels, vertical_pixels].pack("SSSS")
    end
  end

  module IOExtensions
    # TIOCGWINSZ & TIOCSWINSZ are defined in ext/winsize.c

    def winsize
      size = ""
      ioctl(TIOCGWINSZ, size)
      Winsize.new(*size.unpack("SSSS"))
    end

    def winsize=(size)
      size = Winsize.new(*size) unless size.respond_to?(:to_ioctl)
      size = size.to_ioctl
      ioctl(TIOCSWINSZ, size)
    end
  end
end

class IO
  include Winsize::IOExtensions
end
