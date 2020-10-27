      sum(L) -> sum(L,0).
      sum([], Total) -> Total;
      sum([H|T], Total) -> sum(T, H+Total).
