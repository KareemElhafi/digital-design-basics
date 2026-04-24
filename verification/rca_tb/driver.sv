class rca_driver;

    virtual rca_if.DRV vif;
    mailbox gen2drv;

    function new(virtual rca_if.DRV vif, mailbox gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task run();
        rca_transaction tr;

        forever begin
            gen2drv.get(tr);

            @(posedge vif.clk);
            vif.A   <= tr.A;
            vif.B   <= tr.B;
            vif.cin <= tr.cin;
        end
    endtask

endclass