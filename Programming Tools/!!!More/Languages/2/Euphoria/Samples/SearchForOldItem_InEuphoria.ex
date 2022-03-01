global function delete_item( object old, sequence group )
    integer pos
            -- Code begins --
    pos = find( old, group )
    if pos > 0 then
        group = group[1 .. pos-1] & group[pos+1 .. $]
    end if
    return group
end function
