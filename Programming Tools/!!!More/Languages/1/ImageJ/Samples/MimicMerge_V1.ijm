macro "Split and Merge" {
  width = getWidth();
  height = getHeight();
  if ( (width % 2) == 0  ) exit("Image not even # pixels wide.");
  makeRectangle(0, 0, width/2, height);
  right = getImageID();
  slices = nSlices;
  run("Duplicate...", "title=LEFT duplicate range=1-"+slices);
  selectImage(right);
  makeRectangle(width/2, 0, width/2, height);
  run("Crop");
  rightTitle = getTitle();
  run("Merge Channels...", "c1=LEFT c2="+right);
  rename("merged_"+right);
}  // end
