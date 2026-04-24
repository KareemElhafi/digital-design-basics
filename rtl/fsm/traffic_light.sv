module traffic_light (
    input  logic clk,
    input  logic rst,
    output logic [2:0] light
);

typedef enum logic [1:0] {
    GREEN,
    YELLOW,
    RED
} state_t;

state_t state, next;

// State register
always_ff @(posedge clk or posedge rst) begin
    if (rst)
        state <= GREEN;
    else
        state <= next;
end

// Next-state logic
always_comb begin
    case (state)
        GREEN:  next = YELLOW;
        YELLOW: next = RED;
        RED:    next = GREEN;
        default: next = GREEN;
    endcase
end

// Output logic
always_comb begin
    case (state)
        GREEN:  light = 3'b001;
        YELLOW: light = 3'b010;
        RED:    light = 3'b100;
        default: light = 3'b001;
    endcase
end

endmodule