interface rca_if (input logic clk);

    logic [3:0] A, B;
    logic cin;
    logic [3:0] sum;
    logic cout;

    modport DRV (
        input clk,
        output A, B, cin
    );

    modport MON (
        input clk,
        input A, B, cin, sum, cout
    );

endinterface