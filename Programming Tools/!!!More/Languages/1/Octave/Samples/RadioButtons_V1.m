# create figure and panel on it
f = figure;
# create a button group
gp = uibuttongroup (f, "Position", [ 0 0.5 1 1])
# create a buttons in the group
b1 = uicontrol (gp, "style", "radiobutton", "string", "Choice 1", "Position", [ 10 150 100 50 ]);
b2 = uicontrol (gp, "style", "radiobutton", "string", "Choice 2", "Position", [ 10 50 100 30 ]);
# create a button not in the group
b3 = uicontrol (f, "style", "radiobutton","string", "Not in the group","Position", [ 10 50 100 50 ]);

