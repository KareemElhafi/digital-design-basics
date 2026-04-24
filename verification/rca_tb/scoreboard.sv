class rca_scoreboard;

    mailbox mon2scb;

    int pass = 0;
    int fail = 0;

    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
    endfunction

    task run();
        rca_transaction tr;
        bit [4:0] exp;

        forever begin
            mon2scb.get(tr);

            exp = tr.A + tr.B + tr.cin;

            if ({tr.cout, tr.sum} === exp)
                pass++;
            else begin
                fail++;
                $display("Mismatch: A=%0d B=%0d Cin=%0d | Expected=%0d Got=%0d",
                          tr.A, tr.B, tr.cin, exp, {tr.cout, tr.sum});
            end
        end
    endtask

    task report();
        $display("================================");
        $display("        RCA REPORT");
        $display("================================");
        $display("PASS = %0d", pass);
        $display("FAIL = %0d", fail);
        $display("================================");
    endtask

endclass