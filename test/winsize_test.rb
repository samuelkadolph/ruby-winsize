require "test_helper"
require "pty"

describe Winsize do
  it "should add winsize and winsize= to IO" do
    $stdout.must_respond_to(:winsize)
    $stdout.must_respond_to(:winsize=)

    size = $stdout.winsize
    size.rows.wont_be_nil
    size.columns.wont_be_nil
  end

  it "should not work on non tty files" do
    read, _ = IO.pipe
    lambda { read.winsize }.must_raise(Errno::ENOTTY, Errno::EINVAL)
    lambda { read.winsize = [10, 10] }.must_raise(Errno::ENOTTY, Errno::EINVAL)
  end

  it "should set the winsize on a pty" do
    master, slave, pid = PTY.spawn
    begin
      size = Winsize.new(32, 180)
      master.winsize = size
      master.winsize.rows.must_equal(32)
      master.winsize.columns.must_equal(180)
    ensure
      Process.kill(:KILL, pid)
    end
  end
end
