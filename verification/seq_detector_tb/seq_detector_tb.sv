module seq_detector_tb;

    logic clk = 0;
    always #5 clk = ~clk;

    seq_if vif(clk);

    seq_detector dut (
        .clk(clk),
        .rst(vif.rst),
        .x(vif.x),
        .y(vif.y)
    );

    seq_environment env;

    initial begin
        env = new(vif);

        fork
            env.run();
        join_none

        #1500;

        env.scb.report();
        $finish;
    end

endmodule