# create figure and panel on it
f = figure;
# create a button (default style)
b1 = uicontrol (f, "string", "A Button", "position",[10 10 150 40]);
# create an edit control
e1 = uicontrol (f, "style", "edit", "string", "editable text", "position",[10 60 300 40]);
# create a checkbox
c1 = uicontrol (f, "style", "checkbox", "string", "a checkbox", "position",[10 120 150 40]);
