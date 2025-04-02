`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"


class environment;
  transaction trans;
  generator gen;
  driver drv;
  monitor mtr;
  scoreboard sbd;
  virtual intf vinf;
  event next_n;
  
  mailbox mb_gen;
  mailbox mb_drv;
  
  function new(virtual intf vinf);
    this.vinf = vinf;
    
    mb_gen 	 =	new();
    mb_drv	 = 	new();
     
    gen 	 = 	new(mb_gen);
    drv 	 = 	new(mb_gen ,vinf);
    mtr		 =	new(mb_drv ,vinf);
    sbd		 =	new(mb_drv);
    
    gen.next = next_n;
    sbd.next = next_n;
    $display("environment new");

  
  endfunction
  
  
  task run();
    fork
      gen.start();
      drv.start();
      mtr.start();
      sbd.start(); 
    join
  endtask
  
endclass
