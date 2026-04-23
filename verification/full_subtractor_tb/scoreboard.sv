class fs_scoreboard;

    mailbox mon2scb;

    int pass_count = 0;
    int fail_count = 0;

    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
    endfunction

    task run(int num_tests);
        fs_seq_item tr;
        bit exp_diff, exp_bout;

        repeat (num_tests) begin
            mon2scb.get(tr);

            exp_diff = tr.a ^ tr.b ^ tr.bin;
            exp_bout = (~tr.a & tr.b) | (~(tr.a ^ tr.b) & tr.bin);

            if (tr.diff === exp_diff && tr.bout === exp_bout)
                pass_count++;
            else begin
                fail_count++;
                $error("Mismatch: a=%0b b=%0b bin=%0b | diff=%0b bout=%0b (exp diff=%0b bout=%0b)",
                        tr.a, tr.b, tr.bin, tr.diff, tr.bout, exp_diff, exp_bout);
            end
        end
    endtask

    function void report();
        $display("\n===== FULL SUBTRACTOR REPORT =====");
        $display("PASS = %0d", pass_count);
        $display("FAIL = %0d", fail_count);
        $display("=================================\n");
    endfunction

endclass