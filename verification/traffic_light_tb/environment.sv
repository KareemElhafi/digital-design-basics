class tl_environment;

    tl_generator gen;
    tl_driver drv;
    tl_monitor mon;
    tl_scoreboard scb;

    mailbox gen2drv;
    mailbox mon2scb;

    function new(virtual tl_if vif);

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