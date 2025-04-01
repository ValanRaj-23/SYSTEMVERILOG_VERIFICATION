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
  mailbox mb_mtr;
  
  function new(virtual intf vinf);
    this.vinf = vinf;
    
    mb_gen 	 =	new();
    mb_mtr	 = 	new();
     
    gen 	 = 	new(mb_gen);
    drv 	 = 	new(vinf, mb_gen);
    mtr		 =	new(vinf, mb_mtr);
    sbd		 =	new(mb_mtr);
    
    gen.next = next_n;
    sbd.next = next_n;
    $display("environment new");

  
  endfunction
  
  
  task finish();
    fork
      gen.start();
      drv.start();
      mtr.start();
      sbd.start(); 
    join
  endtask
  
endclass
