interface tl_if (input logic clk);

    logic rst;
    logic [2:0] light;

    modport DRV (
        input clk,
        output rst
    );

    modport MON (
        input clk,
        input rst,
        input light
    );

endinterface