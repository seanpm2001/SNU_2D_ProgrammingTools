setBatchMode(true);

total = 0;
for (i = 1; i <= nImages; i++) {
    selectImage(i);
    getRawStatistics(dummy, mean, dummy, dummy, dummy, dummy2);
    total = total + mean;
}
total = total / nImages;

for (i = 1; i <= nImages; i++) {
    selectImage(i);
    getRawStatistics(dummy, mean, dummy, dummy, dummy, dummy2);
    difference = total - mean;
    run("Add...", "value=" + difference);
}

setBatchMode(false);
