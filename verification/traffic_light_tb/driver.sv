class tl_driver;

    virtual tl_if.DRV vif;
    mailbox gen2drv;

    function new(virtual tl_if.DRV vif, mailbox gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task run();
        tl_transaction tr;

        forever begin
            gen2drv.get(tr);

            @(posedge vif.clk);
            vif.rst <= tr.rst;
        end
    endtask

endclass