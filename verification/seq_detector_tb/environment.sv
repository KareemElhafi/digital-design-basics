class seq_environment;

    seq_generator gen;
    seq_driver drv;
    seq_monitor mon;
    seq_scoreboard scb;

    mailbox gen2drv;
    mailbox mon2scb;

    function new(virtual seq_if vif);

        gen2drv = new();
        mon2scb = new();

        gen = new(gen2drv);
        drv = new(vif, gen2drv);
        mon = new(vif, mon2scb);
        scb = new(mon2scb);

    endfunction

    task run();
        fork
            gen.run();
            drv.run();
            mon.run();
            scb.run();
        join_none
    endtask

endclass