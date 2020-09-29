class eth_frame;
   // Definitions as above
   covergroup cov;
      coverpoint dest {
          bins bcast[1] = {48'hFFFFFFFFFFFF};
          bins ucast[1] = default;
      }
      coverpoint f_type {
          bins length[16] = { [0:1535] };
          bins typed[16] = { [1536:32767] };
          bins other[1] = default;
      }
      psize: coverpoint payload.size {
          bins size[] = { 46, [47:63], 64, [65:511], [512:1023], [1024:1499], 1500 };
      }

      sz_x_t: cross f_type, psize;
   endgroup
endclass
