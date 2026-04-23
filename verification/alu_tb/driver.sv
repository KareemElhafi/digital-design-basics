class alu_driver;

    virtual alu_if vif;
    mailbox gen2drv;

    function new(virtual alu_if vif, mailbox gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task run();
        alu_transaction tr;

        forever begin
            gen2drv.get(tr);

            @(posedge vif.clk);
            vif.A        <= tr.A;
            vif.B        <= tr.B;
            vif.alu_ctrl <= tr.alu_ctrl;
        end
    endtask

endclass