class seq_monitor;

    virtual seq_if.MON vif;
    mailbox mon2scb;

    function new(virtual seq_if.MON vif, mailbox mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task run();
        seq_transaction tr;

        forever begin
            @(posedge vif.clk);

            tr = new();
            tr.x   = vif.x;
            tr.rst = vif.rst;
            tr.y   = vif.y;

            mon2scb.put(tr);
        end
    endtask

endclass