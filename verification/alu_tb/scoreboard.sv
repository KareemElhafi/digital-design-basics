class alu_scoreboard;

    mailbox mon2scb;

    int pass_count = 0;
    int fail_count = 0;

    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
    endfunction

    function bit [15:0] expected(input bit [7:0] A,
                                 input bit [7:0] B,
                                 input bit [3:0] ctrl);

        case (ctrl)

            4'b0000: return A + B;
            4'b0001: return A - B;

            4'b0010: return A & B;
            4'b0011: return A | B;
            4'b0100: return A ^ B;

            4'b0101, 4'b1010: return ~A;

            4'b0110: return A + 1;
            4'b0111: return A - 1;

            4'b1000: return A << 1;
            4'b1001: return A >> 1;

            4'b1011: return ~B;

            4'b1100: return A * B;
            4'b1101: return (B != 0) ? A / B : 0;

            4'b1110: return (A == B) ? 1 : 0;

            default: return 0;

        endcase
    endfunction

    task run();
        alu_transaction tr;
        bit [15:0] exp;

        forever begin
            mon2scb.get(tr);

            exp = expected(tr.A, tr.B, tr.alu_ctrl);

            if (tr.alu_result === exp)
                pass_count++;
            else begin
                fail_count++;
                $display("ERROR: A=%0d B=%0d CTRL=%0b EXPECT=%0d GOT=%0d",
                         tr.A, tr.B, tr.alu_ctrl, exp, tr.alu_result);
            end
        end
    endtask

    task report();
        $display("================================");
        $display("        ALU REPORT");
        $display("================================");
        $display("PASS = %0d", pass_count);
        $display("FAIL = %0d", fail_count);
        $display("================================");
    endtask

endclass