class mux_generator;

    mailbox gen2drv;
    int num_tests;

    function new(mailbox gen2drv, int num_tests = 20);
        this.gen2drv = gen2drv;
        this.num_tests = num_tests;
    endfunction

    task run();
        mux_seq_item tr;

        repeat (num_tests) begin
            tr = new();
            assert(tr.randomize()) else $fatal("Randomization Failed");
            gen2drv.put(tr);
        end
    endtask

endclass