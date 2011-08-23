#include "ruby.h"
#include <sys/ioctl.h>

void Init_winsize()
{
  VALUE rb_mWinSize = rb_define_module("Winsize");
  rb_define_const(rb_mWinSize, "TIOCGWINSZ", ULONG2NUM(TIOCGWINSZ));
  rb_define_const(rb_mWinSize, "TIOCSWINSZ", ULONG2NUM(TIOCSWINSZ));
}
