my_options = {"An item", "another", "yet another"};
[sel, ok] = listdlg ("ListString", my_options, "SelectionMode", "Multiple");
if (ok == 1)
  msgbox ("You selected:");
  for i = 1:numel (sel)
    msgbox (sprintf ("\t%s", my_options{sel(i)}));
  endfor
else
  msgbox ("You cancelled.");
endif
