interface fa_if (input logic clk);

    logic a, b, c;
    logic sum, carry;

    // DUT view
    modport DUT (
        input  a, b, c,
        output sum, carry
    );

    // TB view
    modport TB (
        output a, b, c,
        input  sum, carry,
        input  clk
    );

endinterface