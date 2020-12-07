implement Timer;

include "sys.m";
	sys: Sys;
include "draw.m";
Timer: module {
	init: fn (nil: ref Draw->Context, argv: list of string);
};

init(nil: ref Draw->Context, argv: list of string)
{
	sys = load Sys Sys->PATH;

	n := len argv;
	sys->print("Command Line Parameters\n");
	for (i := 0; i < n; i++) {
		sys->sleep(1000);
		sys->print("%d: %s\n", i, hd argv);
		argv = tl argv;
     	}
}
