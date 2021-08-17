/* split timepoints */

// remember the original hyperstack
id = getImageID();

// we need to know only how many frames there are
getDimensions(dummy, dummy, dummy, dummy, nFrames);

// for each frame...
for (frame = 1; frame <= nFrames; frame++) {
    // select the frame
    selectImage(id);
    Stack.setPosition(1, 1, frame);

    // extract one frame
    run("Reduce Dimensionality...", "channels slices keep");
}

// close the original hyperstack
selectImage(id);
close();
