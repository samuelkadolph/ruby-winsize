#include <sys/ioctl.h>
#include "ruby.h"

void Init_winsize()
{
  VALUE rb_cWinSize = rb_define_class("Winsize", rb_cObject);
  rb_define_const(rb_cWinSize, "TIOCGWINSZ", ULONG2NUM(TIOCGWINSZ));
  rb_define_const(rb_cWinSize, "TIOCSWINSZ", ULONG2NUM(TIOCSWINSZ));
}
