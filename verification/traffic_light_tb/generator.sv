class tl_generator;

    mailbox gen2drv;
    int num_cycles = 50;

    function new(mailbox gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    task run();
        tl_transaction tr;

        repeat (num_cycles) begin
            tr = new();

            // Rare reset event
            tr.rst = ($urandom_range(0,10) == 0);

            gen2drv.put(tr);
        end
    endtask

endclass