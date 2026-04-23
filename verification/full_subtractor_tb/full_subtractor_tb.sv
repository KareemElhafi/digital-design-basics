module full_subtractor_tb;

    logic clk = 0;
    always #5 clk = ~clk;

    fs_if intf(clk);

    full_subtractor dut (
        .a(intf.a),
        .b(intf.b),
        .bin(intf.bin),
        .diff(intf.diff),
        .bout(intf.bout)
    );

    fs_environment env;

    initial begin
        env = new(intf);

        env.run();

        env.scb.report();

        $finish;
    end

endmodule