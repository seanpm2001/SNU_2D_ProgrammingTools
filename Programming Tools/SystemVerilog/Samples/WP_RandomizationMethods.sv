class eth_frame;
    rand bit [47:0] dest;
    rand bit [47:0] src;
    rand bit [15:0] f_type;
    rand byte       payload[];
    bit [31:0]      fcs;
    rand bit        corrupted_frame;

    constraint basic {
        payload.size inside {[46:1500]};
    }
    
    function void post_randomize()
      this.calculate_fcs(); // update the fcs field according to the randomized frame
      if (corrupted_frame)  // if this frame should be corrupted 
        this.corrupt_fcs(); // corrupt the fcs
    endfunction
endclass
