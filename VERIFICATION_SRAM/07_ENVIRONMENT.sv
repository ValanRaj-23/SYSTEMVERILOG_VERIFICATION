`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"


class environment #(int times = 30);
  transaction trans;
  generator 	#(times) gen;
  driver 		  #(times) drv;
  monitor 		#(times) mtr;
  scoreboard 	#(times) sbd;
  virtual intf vinf;
  event next_n;
  
  mailbox mb_gen;
  mailbox mb_drv;
  
  function new(virtual intf vinf);
    this.vinf = vinf;
    
    mb_gen 	 =	new();
    mb_drv	 = 	new();
     
    gen 	   = 	new(mb_gen);
    drv 	   = 	new(vinf, mb_gen);
    mtr		   =	new(vinf, mb_drv);
    sbd		   =	new(mb_drv);
    
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
