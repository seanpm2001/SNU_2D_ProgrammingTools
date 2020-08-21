tell application "Finder"
    set x to my myHandler()
    -- or
    set x to myHandler() of me
end tell

on myHandler()
    --commands
end myHandler