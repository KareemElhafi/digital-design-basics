module rca_tb;

    logic clk = 0;
    always #5 clk = ~clk;

    rca_if vif(clk);

    rca_4bit dut (
        .A(vif.A),
        .B(vif.B),
        .cin(vif.cin),
        .sum(vif.sum),
        .cout(vif.cout)
    );

    rca_environment env;

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