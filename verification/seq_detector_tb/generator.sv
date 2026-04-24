class seq_generator;

    mailbox gen2drv;
    int num_cycles = 100;

    function new(mailbox gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    task run();
        seq_transaction tr;

        repeat (num_cycles) begin
            tr = new();

            if (!tr.randomize())
                $fatal("Randomization failed");

            // occasional reset
            tr.rst = ($urandom_range(0,15) == 0);

            gen2drv.put(tr);
        end
    endtask

endclass