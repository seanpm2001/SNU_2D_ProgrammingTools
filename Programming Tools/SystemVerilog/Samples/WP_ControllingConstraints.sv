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
   
    constraint one_src_cst {
        src == 48'h1f00
    }

    constraint dist_to_fcs {
        fcs dist {0:/30,[1:2500]:/50};  // 30, and 50 are the weights (30/80 or  50/80, in this example) 
    }    

endclass
.
.
.
eth_frame my_frame;

my_frame.one_src_cst.constraint_mode(0); // the constraint one_src_cst will not be taken into account
my_frame.f_type.random_mode(0);        // the f_type variable will not be randomized for this frame instance.
my_frame.randomize();
