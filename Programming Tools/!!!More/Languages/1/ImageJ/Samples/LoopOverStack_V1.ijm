#@ImagePlus (label="Some stack") image

selectImage(image);
for (i=1; i<=nSlices; i++) {
    setSlice(i);
    run("Duplicate...", "title=Slice");
    // do some processing
}
