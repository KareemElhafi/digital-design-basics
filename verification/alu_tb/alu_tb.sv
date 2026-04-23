module alu_tb;

    logic clk = 0;
    always #5 clk = ~clk;

    alu_if vif(clk);

    alu8bit dut (
        .A(vif.A),
        .B(vif.B),
        .alu_ctrl(vif.alu_ctrl),
        .alu_result(vif.alu_result)
    );

    alu_env env;

    initial begin
        env = new(vif);

        fork
            env.run();
        join_none

        #2000;

        env.scb.report();
        $finish;
    end

endmodule