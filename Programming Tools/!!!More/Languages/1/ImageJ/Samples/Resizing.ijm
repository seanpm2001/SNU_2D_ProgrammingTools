desiredSelectionWidth = 480;

roiType = selectionType();
getSelectionCoordinates(x, y);
getSelectionBounds(dummy, dummy, selectionWidth, selectionHeight);
factor = desiredSelectionWidth / selectionWidth;
newWidth = round(factor * getWidth());
newHeight = round(factor * getHeight());
run("Select None");
run("Size...", "width=" + newWidth + " height=" + newHeight
    + " average interpolation=Bicubic");
for (i = 0; i < x.length; i++) {
    x[i] = round(x[i] * factor);
    y[i] = round(y[i] * factor);
}
makeSelection(roiType, x, y);
