interface alu_if (input logic clk);

    logic [7:0]  A, B;
    logic [3:0]  alu_ctrl;
    logic [15:0] alu_result;

endinterface