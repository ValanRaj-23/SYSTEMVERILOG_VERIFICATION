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
  
  mailbox mb_gen;
  mailbox mb_mtr;
  
  function new(virtual intf vinf);
    this.vinf = vinf;
    
    mb_gen 	=	new();
    mb_mtr	= 	new();
    
    gen 	= 	new(vinf, mb_gen);
    drv 	= 	new(vinf, mb_gen);
    mtr		=	new(vinf, mb_mtr);
    sbd		=	new(mb_mtr);
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
