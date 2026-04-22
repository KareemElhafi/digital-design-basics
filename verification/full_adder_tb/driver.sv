class fa_driver;

    virtual fa_if.TB vif;
    mailbox gen2drv;

    function new(virtual fa_if.TB vif, mailbox gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task run(int num_tests);
        fa_seq_item tr;

        repeat (num_tests) begin
            gen2drv.get(tr);

            @(posedge vif.clk);
            vif.a <= tr.a;
            vif.b <= tr.b;
            vif.c <= tr.c;
        end
    endtask

endclass