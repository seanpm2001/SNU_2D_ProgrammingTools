// join frames

// get the dimensions
title = getTitle();
getDimensions(width, height, channelCount, sliceCount, frameCount);

if (frameCount > 1)
    exit("Only stacks with 1 timepoint may be open!");

// verify that all images have correct dimensions
setBatchMode(true);
imageCount = nImages;
for (image = 1; image <= imageCount; image++) {
    selectImage(image);
    getDimensions(width2, height2, channelCount2, sliceCount2, frameCount2);
    if (width2 != width || height2 != height || channelCount2 != channelCount ||
            sliceCount2 != sliceCount || frameCount2 != frameCount)
        exit("Dimensions of " + getTitle() + " do not match dimensions of " + title + ": "
            + width2 + "x" + height2 + "x" + channelCount2 + "x" + sliceCount2 + "x" + frameCount2 + " are not "
            + width2 + "x" + height + "x" + channelCount + "x" + sliceCount + "x" + frameCount + "!");
}

// now rename all images so that the names are unique
for (image = 1; image <= imageCount; image++) {
    selectImage(image);
    rename("image-" + image);
}

// now concatenate one by one
selectImage("image-1");
rename("image-0");
for (image = 1; image < imageCount; image++) {
    run("Concatenate...", "stack1=image-" + (image - 1) + " stack2=image-" + (image + 1) + " title=image-" + image);
}

// there is only one image left; rename it to the original title
rename(title);

// set the correct dimensions
Stack.setDimensions(channelCount, sliceCount, imageCount);

// show the image
selectImage(title);
setBatchMode(false);
