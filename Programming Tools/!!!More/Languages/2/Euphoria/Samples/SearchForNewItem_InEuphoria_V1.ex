global function replace_item( object old, object new, sequence group )
    integer pos
            -- Code begins --
    pos = find( old, group )
    if pos > 0 then
        group[pos] = new
    end if
    return group
end function
