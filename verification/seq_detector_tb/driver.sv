class seq_driver;

    virtual seq_if.DRV vif;
    mailbox gen2drv;

    function new(virtual seq_if.DRV vif, mailbox gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task run();
        seq_transaction tr;

        // initial reset
        vif.rst <= 1;
        repeat (2) @(posedge vif.clk);
        vif.rst <= 0;

        forever begin
            gen2drv.get(tr);

            @(posedge vif.clk);
            vif.x   <= tr.x;
            vif.rst <= tr.rst;
        end
    endtask

endclass