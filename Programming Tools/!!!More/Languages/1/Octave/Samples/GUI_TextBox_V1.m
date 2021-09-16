prompt = {"Width", "Height", "Depth"};
defaults = {"1.10", "2.20", "3.30"};
rowscols = [1,10; 2,20; 3,30];
dims = inputdlg (prompt, "Enter Box Dimensions", rowscols, defaults);
