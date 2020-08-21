on open theItems
     repeat with thisItem in theItems
         tell application "Finder" to update thisItem
     end repeat 
end open