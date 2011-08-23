require "mkmf"

abort "sys/ioctl.h is required" unless have_header("sys/ioctl.h")
abort "TIOCGWINSZ is required" unless have_const("TIOCGWINSZ", "sys/ioctl.h")
abort "TIOCSWINSZ is required" unless have_const("TIOCSWINSZ", "sys/ioctl.h")

create_makefile "winsize"
