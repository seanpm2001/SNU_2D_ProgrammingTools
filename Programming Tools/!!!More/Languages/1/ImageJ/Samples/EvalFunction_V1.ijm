run("MRI Stack (528K)");
run("3D Viewer");
call("ij3d.ImageJ3DViewer.add", "mri-stack.tif", "None", "mri-stack.tif", "0", "true", "true", "true", "2", "0");

// Loop over all frames to find the 3D Viewer window(s)
x = 200;
y = 300;
eval("script",
    "frames = java.awt.Frame.getFrames();" +
    "for (f=0; f<frames.length; f++) {" +
    "  frame = frames[f];" +
    "  if (\"ImageJ 3D Viewer\".equals(frame.getTitle())) {" +
    "    frame.setLocation(" + x + ", " + y + ");" +
    "  }" +
    "}"
);

