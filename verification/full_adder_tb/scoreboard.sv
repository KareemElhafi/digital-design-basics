class fa_scoreboard;

    mailbox mon2scb;

    int pass_count = 0;
    int fail_count = 0;

    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
    endfunction

    task run(int num_tests);
        fa_seq_item tr;
        bit exp_sum, exp_carry;

        repeat (num_tests) begin
            mon2scb.get(tr);

            exp_sum   = tr.a ^ tr.b ^ tr.c;
            exp_carry = (tr.a & tr.b) | (tr.b & tr.c) | (tr.c & tr.a);

            if (tr.sum === exp_sum && tr.carry === exp_carry)
                pass_count++;
            else begin
                fail_count++;
                $error("Mismatch: a=%0b b=%0b c=%0b | sum=%0b carry=%0b (exp sum=%0b carry=%0b)",
                        tr.a, tr.b, tr.c, tr.sum, tr.carry, exp_sum, exp_carry);
            end
        end
    endtask

    function void report();
        $display("\n===== REPORT =====");
        $display("PASS = %0d", pass_count);
        $display("FAIL = %0d", fail_count);
        $display("==================\n");
    endfunction

endclass