class fa_environment;

    fa_generator  gen;
    fa_driver     drv;
    fa_monitor    mon;
    fa_scoreboard scb;

    mailbox gen2drv;
    mailbox mon2scb;

    int num_tests;

    function new(virtual fa_if.TB vif, int num_tests = 20);

        this.num_tests = num_tests;

        gen2drv = new();
        mon2scb = new();

        gen = new(gen2drv, num_tests);
        drv = new(vif, gen2drv);
        mon = new(vif, mon2scb);
        scb = new(mon2scb);

    endfunction

    task run();

        fork
            gen.run();
            drv.run(num_tests);
            mon.run(num_tests);
            scb.run(num_tests);
        join

    endtask

endclass