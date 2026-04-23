class alu_monitor;

    virtual alu_if vif;
    mailbox mon2scb;

    function new(virtual alu_if vif, mailbox mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task run();
        alu_transaction tr;

        forever begin
            @(posedge vif.clk);

            tr = new();
            tr.A = vif.A;
            tr.B = vif.B;
            tr.alu_ctrl = vif.alu_ctrl;
            tr.alu_result = vif.alu_result;

            mon2scb.put(tr);
        end
    endtask

endclass