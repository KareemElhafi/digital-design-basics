module alu8bit (
    input  logic [7:0]  A,
    input  logic [7:0]  B,
    input  logic [3:0]  alu_ctrl,
    output logic [15:0] alu_result
);

always_comb begin
    alu_result = '0;

    unique case (alu_ctrl)

        // Arithmetic
        4'b0000: alu_result = A + B;
        4'b0001: alu_result = A - B;

        // Logic
        4'b0010: alu_result = A & B;
        4'b0011: alu_result = A | B;
        4'b0100: alu_result = A ^ B;

        // Unary
        4'b0101,
        4'b1010: alu_result = ~A;

        // Increment / Decrement
        4'b0110: alu_result = A + 8'd1;
        4'b0111: alu_result = A - 8'd1;

        // Shift
        4'b1000: alu_result = A << 1;
        4'b1001: alu_result = A >> 1;

        // NOT B
        4'b1011: alu_result = ~B;

        // Multiply / Divide
        4'b1100: alu_result = A * B;
        4'b1101: alu_result = (B != 0) ? (A / B) : '0;

        // Compare
        4'b1110: alu_result = (A == B) ? 16'd1 : 16'd0;

        default: alu_result = '0;

    endcase
end

endmodule