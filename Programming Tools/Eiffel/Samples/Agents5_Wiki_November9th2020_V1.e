my_list.do_all (agent (s: STRING)
     require
         not_void: s /= Void
     do
         s.append_character (',')
     ensure
         appended: s.count = old s.count + 1
     end)
