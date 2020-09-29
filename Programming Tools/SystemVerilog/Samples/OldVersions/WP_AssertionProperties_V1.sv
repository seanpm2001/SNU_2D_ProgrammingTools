property req_gnt;
    @(posedge clk) req |=> gnt;
endproperty

assert_req_gnt: assert property (req_gnt) else $error("req not followed by gnt.");
