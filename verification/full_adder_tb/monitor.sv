class fa_monitor;

    virtual fa_if.TB vif;
    mailbox mon2scb;

    function new(virtual fa_if.TB vif, mailbox mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task run(int num_tests);
        fa_seq_item tr;

        repeat (num_tests) begin
            @(posedge vif.clk);
            #1; // allow signals to settle

            tr = new();
            tr.a = vif.a;
            tr.b = vif.b;
            tr.c = vif.c;
            tr.sum = vif.sum;
            tr.carry = vif.carry;

            mon2scb.put(tr);
        end
    endtask

endclass