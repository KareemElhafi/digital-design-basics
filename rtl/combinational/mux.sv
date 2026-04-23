module mux (
    input  logic a,
    input  logic b,
    input  logic s0,
    output logic y
);

    assign y = (s0) ? b : a;

endmodule