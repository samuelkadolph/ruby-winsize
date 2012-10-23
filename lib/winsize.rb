class Winsize
  require "winsize.so"
  require "winsize/version"

  attr_accessor :rows, :columns, :horizontal_pixels, :vertical_pixels
  alias cols columns

  def initialize(rows, columns, horizontal_pixels = 0, vertical_pixels = 0)
    @rows, @columns, @horizontal_pixels, @vertical_pixels = rows, columns, horizontal_pixels, vertical_pixels
  end

  def [](index)
    to_ary[index]
  end

  def to_ary
    [rows, columns, horizontal_pixels, vertical_pixels]
  end

  def to_ioctl
    [rows, columns, horizontal_pixels, vertical_pixels].pack("SSSS")
  end

  module IOExtension
    def winsize
      size = ""
      ioctl(TIOCGWINSZ, size)
      Winsize.new(*size.unpack("SSSS"))
    end

    def winsize=(size)
      size = size.respond_to?(:to_ioctl) ? size.to_ioctl : Winsize.new(*size).to_ioctl
      ioctl(TIOCSWINSZ, size)
    end
  end
end

class IO
  include Winsize::IOExtension
end
