interface fs_if (input logic clk);

    logic a, b, bin;
    logic diff, bout;

    // DUT side
    modport DUT (
        input  a, b, bin,
        output diff, bout
    );

    // Testbench side
    modport TB (
        output a, b, bin,
        input  diff, bout,
        input  clk
    );

endinterface