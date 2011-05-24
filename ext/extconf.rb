require "mkmf"

abort("ioctl is missing.\n\n") unless have_header("sys/ioctl.h")

create_makefile("winsize")
