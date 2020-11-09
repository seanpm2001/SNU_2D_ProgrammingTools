   some_attribute: detachable SOME_TYPE
    
   use_some_attribute
                -- Set value of some_attribute to `v'.
            do
                if attached some_attribute as l_attribute then
                    do_something (l_attribute)
                end
            end
    
    do_something (a_value: SOME_TYPE)
                -- Do something with `a_value'.
            do
               ... doing something with `a_value' ...
            end
