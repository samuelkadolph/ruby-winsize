require "mkmf"

abort("sys/ioctl.h is required.") unless have_header("sys/ioctl.h")
abort("TIOCGWINSZ is required.") unless have_const("TIOCGWINSZ")
abort("TIOCSWINSZ is required.") unless have_const("TIOCSWINSZ")

create_makefile("winsize")
