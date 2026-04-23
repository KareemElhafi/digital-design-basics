class mux_scoreboard;

    mailbox mon2scb;

    int pass_count = 0;
    int fail_count = 0;

    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
    endfunction

    task run(int num_tests);
        mux_seq_item tr;
        bit exp_y;

        repeat (num_tests) begin
            mon2scb.get(tr);

            exp_y = (tr.s0) ? tr.b : tr.a;

            if (tr.y === exp_y)
                pass_count++;
            else begin
                fail_count++;
                $error("Mismatch: a=%0b b=%0b s0=%0b | y=%0b (exp=%0b)",
                        tr.a, tr.b, tr.s0, tr.y, exp_y);
            end
        end
    endtask

    function void report();
        $display("\n===== MUX REPORT =====");
        $display("PASS = %0d", pass_count);
        $display("FAIL = %0d", fail_count);
        $display("======================\n");
    endfunction

endclass