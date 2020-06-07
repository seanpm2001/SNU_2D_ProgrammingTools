// Start of script
/* Forced Java Garbage collector - the Garbage truck Java script
Version 1 (October 9th 2019)
First version: 1 (October 9th 2019)
Latest version: 1 (October 9th 2019) */
/*
// Implementation of "inspectheap" command // from SO
//  // from SO
// Input arguments :- // from SO
//   arg0: "-live" or "-all" // from SO
// credit: https://stackoverflow.com/a/7958004
*/
import java.util.Scanner();
// import java.util.[GARBAGE_COLLECTION_UTILITY_HERE_IF_NEEDED];
public class dumpTruck() {
	public main garbageCollectorForce() {
		System.out.println("Forced Java garbage collector");
		System.out.println("The Java garbage truck");
		jintHeap64(); // Calls the garbage collection method
		System.out.println("Garbage collection finished");
		/* Finalization and exit of terminal script
		// scann = new Scanner(System.in); // this one
		//scann = new Scanner(input); // this one, or other
		// scann.close();
		*/
} // End of main method
		public static void jintHeap64 {
			static jint heap_inspection(AttachOperation* op, outputStream* out) { // from SO
				bool live_objects_only = true; // default is true to retain the behavior before this change is made // from SO
				const char* arg0 = op->arg(0); // from SO
				if (arg0 != NULL && (strlen(arg0) > 0)) { // from SO
				if (strcmp(arg0, "-all") != 0 && strcmp(arg0, "-live") != 0) { // from SO
					out->print_cr("Invalid argument to inspectheap operation: %s", arg0); // from SO
					return JNI_ERR; // from SO
		} // from SO
		live_objects_only = strcmp(arg0, "-live") == 0; // from SO
	} // from SO
	VM_GC_HeapInspection heapop(out, live_objects_only /* request full gc */, true /* need_prologue */); // from SO
	VMThread::execute(&heapop); // from SO
	return JNI_OK; // from SO
}}} // It all ends here
/*jmap -dump:format=b,file=heap.1 [pid]
jmap -dump:live,format=b,file=heap.2 [pid]
jmap -dump:format=b,file=heap.3 [pid]
*/
/*
// End of script
// Script is not yet functional
*/