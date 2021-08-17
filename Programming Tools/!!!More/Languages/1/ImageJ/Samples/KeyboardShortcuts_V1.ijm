// install a keyboard shortcut: when pressing Ctrl+J,
// the user is asked for JPEG quality and for a location
// to save the current image as .jpg file

macro "Save As JPEG... [j]" {
    quality = call("ij.plugin.JpegWriter.getQuality");
    quality = getNumber("JPEG quality (0-100):", quality);
    run("Input/Output...", "jpeg="+quality);
    saveAs("Jpeg");
}
