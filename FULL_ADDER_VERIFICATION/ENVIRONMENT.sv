`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "score_board.sv"

class environment;
  transaction trans;
  generator gen;
  driver drv;
  monitor mr;
  score_board scb;
  
  mailbox mb_gen;
  mailbox mb_scb;
  
  virtual inf vinf;
  
  function new(virtual inf vinf);
    
    this.vinf = vinf; 
    mb_gen 	= 	new();
    mb_scb 	= 	new();
    	
    gen 	= 	new(mb_gen);
    drv 	= 	new(vinf,mb_gen);
    mr  	= 	new(vinf,mb_scb);
    scb		=	new(mb_scb);
    
  endfunction
  
  
  task start_all();    
    fork 	  	
      gen.start();
      drv.start(); 
      mr.start();  
      scb.start();	
    join
    $display(" PROCESS: ENVIRONMENT");
  endtask
  
endclass
  
