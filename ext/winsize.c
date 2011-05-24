#include "ruby.h"
#include <sys/ioctl.h>

void Init_winsize()
{
	VALUE rb_mWinSize = rb_define_module("Winsize");
	rb_const_set(rb_mWinSize, rb_intern("TIOCGWINSZ"), ULONG2NUM(TIOCGWINSZ));
	rb_const_set(rb_mWinSize, rb_intern("TIOCSWINSZ"), ULONG2NUM(TIOCSWINSZ));
}
