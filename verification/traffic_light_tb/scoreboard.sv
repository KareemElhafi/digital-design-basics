class tl_scoreboard;

    mailbox mon2scb;

    int pass = 0;
    int fail = 0;

    typedef enum logic [1:0] {GREEN, YELLOW, RED} state_t;
    state_t state = GREEN;

    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
    endfunction

    function bit [2:0] expected_output(state_t s);
        case (s)
            GREEN:  return 3'b001;
            YELLOW: return 3'b010;
            RED:    return 3'b100;
        endcase
    endfunction

    function state_t next_state(state_t s);
        case (s)
            GREEN:  return YELLOW;
            YELLOW: return RED;
            RED:    return GREEN;
        endcase
    endfunction

    task run();
        tl_transaction tr;
        bit [2:0] exp;

        forever begin
            mon2scb.get(tr);

            if (tr.rst) begin
                state = GREEN;
            end else begin
                exp = expected_output(state);

                if (tr.light === exp)
                    pass++;
                else begin
                    fail++;
                    $display("Mismatch: expected=%b got=%b", exp, tr.light);
                end

                state = next_state(state);
            end
        end
    endtask

    task report();
        $display("================================");
        $display(" TRAFFIC LIGHT FSM REPORT");
        $display("================================");
        $display("PASS = %0d", pass);
        $display("FAIL = %0d", fail);
        $display("================================");
    endtask

endclass