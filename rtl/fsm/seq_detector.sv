module seq_detector (
    input  logic clk,
    input  logic rst,
    input  logic x,
    output logic y
);

typedef enum logic [2:0] {
    S0, S1, S2, S3, S4
} state_t;

state_t state, next;

// State register
always_ff @(posedge clk or posedge rst) begin
    if (rst)
        state <= S0;
    else
        state <= next;
end

// Next state logic
always_comb begin
    case (state)
        S0: next = x ? S1 : S0;
        S1: next = x ? S1 : S2;
        S2: next = x ? S3 : S0;
        S3: next = x ? S4 : S2;
        S4: next = x ? S1 : S2;
        default: next = S0;
    endcase
end

// Moore output
always_comb begin
    y = (state == S4);
end

endmodule