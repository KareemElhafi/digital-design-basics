class mux_driver;

    virtual mux_if.TB vif;
    mailbox gen2drv;

    function new(virtual mux_if.TB vif, mailbox gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task run(int num_tests);
        mux_seq_item tr;

        repeat (num_tests) begin
            gen2drv.get(tr);

            @(posedge vif.clk);
            vif.a  <= tr.a;
            vif.b  <= tr.b;
            vif.s0 <= tr.s0;
        end
    endtask

endclass