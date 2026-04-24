class rca_generator;

    mailbox gen2drv;
    int num_tests = 100;

    function new(mailbox gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    task run();
        rca_transaction tr;

        repeat (num_tests) begin
            tr = new();

            if (!tr.randomize())
                $fatal("Randomization failed");

            gen2drv.put(tr);
        end
    endtask

endclass