interface mux_if (input logic clk);

    logic a, b, s0;
    logic y;

    // DUT side
    modport DUT (
        input  a, b, s0,
        output y
    );

    // TB side
    modport TB (
        output a, b, s0,
        input  y,
        input  clk
    );

endinterface