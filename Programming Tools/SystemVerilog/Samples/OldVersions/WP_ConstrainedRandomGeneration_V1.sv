class eth_frame;
    rand bit [47:0] dest;
    rand bit [47:0] src;
    rand bit [15:0] f_type;
    rand byte       payload[];
    bit [31:0]      fcs;
    rand bit [31:0] fcs_corrupt;

    constraint basic {
        payload.size inside {[46:1500]};
    }

    constraint good_fr {
        fcs_corrupt == 0;
    }
endclass
