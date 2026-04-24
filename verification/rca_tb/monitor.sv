class rca_monitor;

    virtual rca_if.MON vif;
    mailbox mon2scb;

    function new(virtual rca_if.MON vif, mailbox mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task run();
        rca_transaction tr;

        forever begin
            @(posedge vif.clk);

            tr = new();
            tr.A    = vif.A;
            tr.B    = vif.B;
            tr.cin  = vif.cin;
            tr.sum  = vif.sum;
            tr.cout = vif.cout;

            mon2scb.put(tr);
        end
    endtask

endclass