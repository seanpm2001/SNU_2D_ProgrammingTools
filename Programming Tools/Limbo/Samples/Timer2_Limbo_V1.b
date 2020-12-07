implement Timer2;

include "sys.m";
	sys: Sys;
include "draw.m";

Timer2: module {
	init: fn (nil: ref Draw->Context, argv: list of string);
};

init(nil: ref Draw->Context, argv: list of string)
{
	sys = load Sys Sys->PATH;

	sync := chan of int;
	n := len argv;
	spawn timer(sync, n);

	sys->print("Command Line Parameters\n");
	for (i := 0; i < n; i++) {
		<-sync;
		sys->print("%d: %s\n", i, hd argv);
		argv = tl argv;
	}
}

timer(sync: chan of int, n: int)
{
	for (i := 0; i < n; i++) {
		sys->sleep(1000);
		sync <-= 1;
	}
}
