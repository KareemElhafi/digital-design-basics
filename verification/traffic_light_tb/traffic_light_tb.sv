module traffic_light_tb;

    logic clk = 0;
    always #5 clk = ~clk;

    tl_if vif(clk);

    traffic_light dut (
        .clk(clk),
        .rst(vif.rst),
        .light(vif.light)
    );

    tl_environment env;

    initial begin
        env = new(vif);

        fork
            env.run();
        join_none

        #1000;

        env.scb.report();
        $finish;
    end

endmodule