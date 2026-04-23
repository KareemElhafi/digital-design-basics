class mux_monitor;

    virtual mux_if.TB vif;
    mailbox mon2scb;

    function new(virtual mux_if.TB vif, mailbox mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task run(int num_tests);
        mux_seq_item tr;

        repeat (num_tests) begin
            @(posedge vif.clk);
            #1;

            tr = new();
            tr.a  = vif.a;
            tr.b  = vif.b;
            tr.s0 = vif.s0;
            tr.y  = vif.y;

            mon2scb.put(tr);
        end
    endtask

endclass