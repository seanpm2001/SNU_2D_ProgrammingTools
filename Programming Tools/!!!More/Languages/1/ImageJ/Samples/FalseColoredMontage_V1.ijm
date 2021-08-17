function simplifyColors() {
    run("Duplicate...", "title=step-1");
    run("HSB Stack");
    setSlice(2);
    stack = getImageID();
    run("Duplicate...", "title=threshold");
    run("Gamma...", "value=0.30");
    run("Bilateral Filter", "spatial=15 range=150");
    run("Select All");
    run("Copy");
    close();
    selectImage(stack);
    run("Paste");
    setSlice(1);
    run("Duplicate...", "title=bilateral");
    run("Bilateral Filter", "spatial=15 range=150");
    run("Enhance Contrast", "saturated=0.4");
    run("Select All");
    run("Copy");
    close();
    selectImage(stack);
    run("Paste");
    run("RGB Color");
}

function warholize(order, invertR, invertG, invertB) {
    if (order == 0)
        order = "1,2,3";
    else if (order == 1)
        order = "1,3,2";
    else if (order == 2)
        order = "2,1,3";
    else if (order == 3)
        order = "2,3,1";
    else if (order == 4)
        order = "3,1,2";
    else if (order == 5)
        order = "3,2,1";
    run("Make Substack...", "slices=" + order);
    if (invertR != 0) {
        setSlice(1);
        run("Invert", "slice");
    }
    if (invertG != 0) {
        setSlice(2);
        run("Invert", "slice");
    }
    if (invertB != 0) {
        setSlice(3);
        run("Invert", "slice");
    }
    run("Stack to RGB");
}

function makeMontage(big) {
    orig = getImageID();
    w = getWidth();
    h = getHeight();

    columns = 3;
    rows = 3;
    orders = newArray(3, 4, 5, 1, 3, 5, 5, 1, 2);
    inverts = newArray(6, 5, 7, 1, 4, 1, 0, 2, 0);

    if (big) {
        columns = 8;
        rows = 6;
        orders = newArray(columns * rows);
        inverts = newArray(columns * rows);
        for (column = 0; column < columns; column++)
            for (row = 0; row < rows; row++) {
                index = column + columns * row;
                orders[index] = row;
                inverts[index] = column;
            }
    }
    else if (randomize) {
        for (i = 0; i < orders.length; i++) {
            orders[i] = floor(random() * 5.999);
            inverts[i] = 1 * floor(random() * 1.2)
                + 2 * floor(random() * 1.2)
                + 4 * floor(random() * 1.2);
            // avoid duplicates
            for (j = 0; j < i; j++)
                if ((orders[j] == orders[i] && inverts[j] == inverts[i])
                        || (orders[i] == 0 && inverts[i] == 0)) {
                    i--;
                    j = i;
                }
        }
    }

    // create the panel
    newImage("Warhol'ized " + getTitle(), "RGB white",
        (w + 1) * columns + 1, (h + 1) * rows + 1, 1);
    result = getImageID();

    // for speed, and to minimize user interference, start the batch mode
    setBatchMode(true);
    selectImage(orig);
    run("Duplicate...", "title=stack");
    run("RGB Color");
    simplifyColors();
    run("RGB Stack");
    stack = getImageID();

    // fill the panel
    for (column = 0; column < columns; column++)
        for (row = 0; row < rows; row++) {
            selectImage(stack);
            index = column + columns * row;
            i = inverts[index];
            warholize(orders[index], i & 1, i & 2, i & 4);

            // copy the false-color image into the clipboard
            makeRectangle(0, 0, w, h);
            run("Copy");
            close();

            // paste the clipboard, at the correct location
            selectImage(result);
            makeRectangle((w + 1) * column + 1, (h + 1) * row + 1, w, h);
            run("Paste");
        }

    run("Select None");
    selectImage(stack);
    close();
    setBatchMode(false);
}

randomize = true;
makeMontage(false);
