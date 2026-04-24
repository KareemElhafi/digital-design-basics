interface seq_if (input logic clk);

    logic rst;
    logic x;
    logic y;

    modport DRV (
        input clk,
        output rst, x
    );

    modport MON (
        input clk,
        input rst, x, y
    );

endinterface