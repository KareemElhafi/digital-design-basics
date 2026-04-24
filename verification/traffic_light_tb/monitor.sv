class tl_monitor;

    virtual tl_if.MON vif;
    mailbox mon2scb;

    function new(virtual tl_if.MON vif, mailbox mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task run();
        tl_transaction tr;

        forever begin
            @(posedge vif.clk);

            tr = new();
            tr.rst   = vif.rst;
            tr.light = vif.light;

            mon2scb.put(tr);
        end
    endtask

endclass