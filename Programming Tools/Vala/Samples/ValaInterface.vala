using GLib;

interface Printable {
	abstract string print ();
	string pretty_print (){
		return "Please " + print ();
	}
}

class NormalPrint : Object, Printable {
	override string print () {
		return "don't forget about me";
	}
}

class OverridePrint : Object, Printable {
	override string print () {
		return "Mind the gap";
	}

	override string pretty_print () {
		return "Override";
	}
}

void main (string[] args) {
	var normal = new NormalPrint ();
	var overridden = new OverridePrint ();

	print (normal.pretty_print ());
	print (overridden.pretty_print ());
}
