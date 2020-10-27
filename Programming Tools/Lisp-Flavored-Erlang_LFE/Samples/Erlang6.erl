      universal_server() ->
          receive
              {become, Func} ->
                  Func()
          end.
