class seq_scoreboard;

    mailbox mon2scb;

    int pass = 0;
    int fail = 0;

    typedef enum logic [2:0] {S0, S1, S2, S3, S4} state_t;
    state_t state = S0;

    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
    endfunction

    function state_t next_state(state_t s, bit x);
        case (s)
            S0: return x ? S1 : S0;
            S1: return x ? S1 : S2;
            S2: return x ? S3 : S0;
            S3: return x ? S4 : S2;
            S4: return x ? S1 : S2;
        endcase
    endfunction

    function bit expected_output(state_t s);
        return (s == S4);
    endfunction

    task run();
        seq_transaction tr;
        bit exp;

        forever begin
            mon2scb.get(tr);

            if (tr.rst) begin
                state = S0;
            end else begin
                exp = expected_output(state);

                if (tr.y === exp)
                    pass++;
                else begin
                    fail++;
                    $display("Mismatch: expected=%0b got=%0b", exp, tr.y);
                end

                state = next_state(state, tr.x);
            end
        end
    endtask

    task report();
        $display("================================");
        $display(" SEQUENCE DETECTOR REPORT");
        $display("================================");
        $display("PASS = %0d", pass);
        $display("FAIL = %0d", fail);
        $display("================================");
    endtask

endclass