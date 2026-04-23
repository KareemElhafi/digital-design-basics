module mux_tb;

    logic clk = 0;
    always #5 clk = ~clk;

    mux_if intf(clk);

    mux dut (
        .a(intf.a),
        .b(intf.b),
        .s0(intf.s0),
        .y(intf.y)
    );

    mux_environment env;

    initial begin
        env = new(intf);

        env.run();

        env.scb.report();

        $finish;
    end

endmodule