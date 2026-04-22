module full_adder_tb;

    logic clk = 0;

    always #5 clk = ~clk;

    fa_if intf(clk);

    full_adder dut (
        .a(intf.a),
        .b(intf.b),
        .c(intf.c),
        .sum(intf.sum),
        .carry(intf.carry)
    );

    fa_environment env;

    initial begin
        env = new(intf);

        env.run();

        env.scb.report();

        $finish;
    end

endmodule