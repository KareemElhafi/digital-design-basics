class fa_generator;

    mailbox gen2drv;
    int num_tests;

    event done;

    function new(mailbox gen2drv, int num_tests = 20);
        this.gen2drv = gen2drv;
        this.num_tests = num_tests;
    endfunction

    task run();
        fa_seq_item tr;

        repeat (num_tests) begin
            tr = new();
            assert(tr.randomize()) else $fatal("Randomization Failed");
            gen2drv.put(tr);
        end

        -> done; // signal completion
    endtask

endclass