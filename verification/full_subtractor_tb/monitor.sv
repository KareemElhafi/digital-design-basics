class fs_monitor;

    virtual fs_if.TB vif;
    mailbox mon2scb;

    function new(virtual fs_if.TB vif, mailbox mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task run(int num_tests);
        fs_seq_item tr;

        repeat (num_tests) begin
            @(posedge vif.clk);
            #1;

            tr = new();
            tr.a   = vif.a;
            tr.b   = vif.b;
            tr.bin = vif.bin;
            tr.diff = vif.diff;
            tr.bout = vif.bout;

            mon2scb.put(tr);
        end
    endtask

endclass