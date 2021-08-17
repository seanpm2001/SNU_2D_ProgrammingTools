// A right-click on the tool icon lets the user change
// the JPEG Quality

macro "Save As JPEG Action Tool Options" {
    quality = call("ij.plugin.JpegWriter.getQuality");
    quality = getNumber("JPEG quality (0-100):", quality);
    run("Input/Output...", "jpeg="+quality);
}
