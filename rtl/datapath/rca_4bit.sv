module rca_4bit (
    input  logic [3:0] A,
    input  logic [3:0] B,
    input  logic       cin,
    output logic [3:0] sum,
    output logic       cout
);

    logic c1, c2, c3;

    full_adder fa0 (.a(A[0]), .b(B[0]), .c(cin), .sum(sum[0]), .carry(c1));
    full_adder fa1 (.a(A[1]), .b(B[1]), .c(c1),  .sum(sum[1]), .carry(c2));
    full_adder fa2 (.a(A[2]), .b(B[2]), .c(c2),  .sum(sum[2]), .carry(c3));
    full_adder fa3 (.a(A[3]), .b(B[3]), .c(c3),  .sum(sum[3]), .carry(cout));

endmodule